import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:crypto_app/ui/currency/widgets/line_chart_widget.dart';
import 'package:crypto_app/ui/currency/widgets/time_chip.dart';
import 'package:crypto_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CurrencyDetailsPage extends StatefulWidget {
  final Currency? currency;
  CurrencyDetailsPage(this.currency);

  @override
  _CurrencyDetailsPageState createState() => _CurrencyDetailsPageState();
}

class _CurrencyDetailsPageState extends State<CurrencyDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final price = double.parse(widget.currency!.price!);

    final formattedPrice = Utils.formatNumber(price);

    final priceChangePct =
        double.parse(widget.currency!.day!.priceChangePct!) * 100;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // flexibleSpace: Container(),
            title: Text(
              widget.currency!.name!,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                children: [
                  Text(
                    "\$$formattedPrice",
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  const SizedBox(height: 5),
                  priceChangePct.isNegative
                      ? Text(
                          "${priceChangePct.toStringAsFixed(2)}%",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.red,
                                  ),
                        )
                      : Text(
                          "+${priceChangePct.toStringAsFixed(2)}%",
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    color: Colors.green,
                                  ),
                        ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16.0),
                    right: Radius.circular(16.0),
                  ),
                ),
                child: LineChartWidget(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TimeChip(
                      active: true,
                      time: "1H",
                    ),
                    TimeChip(
                      active: false,
                      time: "1D",
                    ),
                    TimeChip(
                      active: false,
                      time: "1W",
                    ),
                    TimeChip(
                      active: false,
                      time: "1M",
                    ),
                    TimeChip(
                      active: false,
                      time: "1Y",
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  leading: Icon(Icons.show_chart),
                  title: Text(
                    "Market Cap",
                  ),
                  trailing: Text("3,000,000"),
                ),
                ListTile(
                  leading: Icon(Icons.bar_chart),
                  title: Text(
                    "Volume",
                  ),
                  trailing: Text("3,000,000"),
                ),
                ListTile(
                  leading: Icon(Icons.timelapse_outlined),
                  title: Text(
                    "Circulating Supply",
                  ),
                  trailing: Text("3,000,000"),
                ),
                ListTile(
                  leading: Icon(Icons.whatshot),
                  title: Text(
                    "Rank",
                  ),
                  trailing: Text("#1"),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
