import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:crypto_app/ui/currency/pages/currencies.dart';
import 'package:crypto_app/ui/currency/pages/currency_details.dart';
import 'package:crypto_app/ui/currency/pages/currency_search_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/currencies':
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => CurrenciesPage(),
        );

      case '/currency_details':
        final Currency currency = settings.arguments;
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => CurrencyDetailsPage(currency),
        );
      case '/currency_search':
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => CurrencySearchPage(),
        );

      default:
        return MaterialPageRoute<bool>(
          builder: (BuildContext context) => Scaffold(
            body: Center(child: Text("Can't find this page")),
          ),
        );
    }
  }
}
