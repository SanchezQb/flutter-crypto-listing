import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:crypto_app/ui/currency/providers/currency_provider.dart';
import 'package:crypto_app/ui/currency/providers/currency_state.dart';
import 'package:crypto_app/ui/currency/widgets/currency_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrenciesPage extends StatefulWidget {
  @override
  _CurrenciesPageState createState() => _CurrenciesPageState();
}

class _CurrenciesPageState extends State<CurrenciesPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero)
        .then((_) => context.read(currencyStateNotifier).getCurrencies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          "Markets",
          style: Theme.of(context).textTheme.headline6.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              Navigator.of(context).pushNamed("/currency_search");
            },
          )
        ],
      ),
      body: Stack(
        children: [
          Consumer(
            builder: (context, watch, child) {
              final state = watch(currencyStateNotifier.state);
              if (state is CurrencyLoadingState) {
                return Center(
                  child: const CircularProgressIndicator(),
                );
              }
              if (state is CurrencyErrorState) {
                return Center(
                  child: Text(state.message),
                );
              }
              if (state is CurrencyLoadedState) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 20.0,
                  ),
                  child: Column(
                    children: [
                      // TextField(
                      //   onChanged: (value) {
                      //     context.read(currencyStateNotifier).search(value);
                      //   },
                      //   decoration: InputDecoration(
                      //     contentPadding: const EdgeInsets.all(10.0),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(25.0),
                      //       borderSide: BorderSide(
                      //         width: 0,
                      //         style: BorderStyle.none,
                      //       ),
                      //     ),
                      //     hintText: 'Search',
                      //     filled: true,
                      //     prefixIcon: const Icon(
                      //       Icons.search,
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.currencies.length,
                          itemBuilder: (context, index) {
                            final Currency currency = state.currencies[index];
                            return CurrencyListTile(
                              currency: currency,
                            );
                          },
                        ),
                      )
                    ],
                  ),
                );
              }
              return Container();
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                    Theme.of(context).scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
