import 'package:crypto_app/routes.dart';
import 'package:crypto_app/theme/app_theme.dart';
import 'package:crypto_app/ui/currency/pages/currencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.dark,
      onGenerateRoute: Routes.generateRoutes,
      home: CurrenciesPage(),
    );
  }
}
