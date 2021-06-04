import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyDetailsPage extends StatefulWidget {
  final Currency currency;
  CurrencyDetailsPage(this.currency);

  @override
  _CurrencyDetailsPageState createState() => _CurrencyDetailsPageState();
}

class _CurrencyDetailsPageState extends State<CurrencyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(),
    );
  }
}
