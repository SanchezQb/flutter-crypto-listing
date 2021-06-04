import 'package:flutter/foundation.dart';

import 'package:crypto_app/ui/currency/models/currency.dart';

abstract class CurrencyState {
  const CurrencyState();
}

class CurrencyInitialState extends CurrencyState {
  const CurrencyInitialState();
}

class CurrencyLoadingState extends CurrencyState {
  const CurrencyLoadingState();
}

class CurrencyLoadedState extends CurrencyState {
  final List<Currency> currencies;

  const CurrencyLoadedState({this.currencies});

  CurrencyLoadedState copy({
    List<Currency> currencies,
  }) =>
      CurrencyLoadedState(
        currencies: currencies ?? this.currencies,
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyLoadedState &&
        listEquals(other.currencies, currencies);
  }

  @override
  int get hashCode => currencies.hashCode;
}

class CurrencyErrorState extends CurrencyState {
  final String message;

  const CurrencyErrorState(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CurrencyErrorState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
