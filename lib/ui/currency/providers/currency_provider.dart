import 'package:crypto_app/services/api_service.dart';
import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:crypto_app/ui/currency/providers/currency_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyStateNotifier extends StateNotifier<CurrencyState> {
  final Reader read;
  CurrencyStateNotifier(this.read) : super(CurrencyInitialState());

  Future<void> getCurrencies() async {
    state = CurrencyLoadingState();
    try {
      final List<Currency> currencies =
          await read(apiServiceProvider).getCurrencies();
      state = CurrencyLoadedState(currencies: currencies);
    } on DioError catch (e) {
      final error = e.response!.data;
      state = CurrencyErrorState(error['message']);
    }
  }

  void search(String query) {
    if (state is CurrencyLoadedState) {
      final newState = state as CurrencyLoadedState;
      final filteredCurrencies = newState.currencies!
          .where((currency) => currency.name!.contains(query))
          .toList();
      state = newState.copy(currencies: filteredCurrencies);
    }
  }
}

final currencyStateNotifier =
    StateNotifierProvider((ref) => CurrencyStateNotifier(ref.read));
