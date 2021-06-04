import 'package:crypto_app/constants/constants.dart';
import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ApiService {
  static BaseOptions options = new BaseOptions(
    baseUrl: "https://api.nomics.com/v1",
  );
  Dio dio = new Dio(options);

  Future<List<Currency>> getCurrencies() async {
    final endPoint =
        "/currencies/ticker?key=$kApiKey&interval=1h,1d,7d,30d,365d&per-page=100&page=1";
    Response response = await dio.get(endPoint);

    final payload = response.data as List;
    final data = payload.map((data) => Currency.fromJson(data));
    return data.toList();
  }
}

final apiServiceProvider = Provider((ref) => ApiService());
