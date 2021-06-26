import 'package:crypto_app/ui/currency/models/currency.dart';
import 'package:crypto_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyListTile extends StatelessWidget {
  const CurrencyListTile({
    Key? key,
    required this.currency,
  }) : super(key: key);

  final Currency currency;

  @override
  Widget build(BuildContext context) {
    final isSvg = currency.logoUrl!.endsWith(".svg");

    final price = double.parse(currency.price!);

    final formattedPrice = Utils.formatNumber(price);

    final priceChangePct = double.parse(currency.day!.priceChangePct!) * 100;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      onTap: () {
        Navigator.of(context).pushNamed(
          "/currency_details",
          arguments: currency,
        );
      },
      leading: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: Colors.grey[850],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: isSvg
              ? SvgPicture.network(
                  currency.logoUrl!,
                  placeholderBuilder: (context) {
                    return const SizedBox();
                  },
                )
              : Image.network(
                  currency.logoUrl!,
                  fit: BoxFit.cover,
                ),
        ),
      ),
      title: Text(
        currency.symbol!,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        currency.name!,
        style: Theme.of(context).textTheme.caption,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$$formattedPrice",
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          const SizedBox(height: 5),
          priceChangePct.isNegative
              ? Text(
                  "${priceChangePct.toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.red,
                      ),
                )
              : Text(
                  "+${priceChangePct.toStringAsFixed(2)}%",
                  style: Theme.of(context).textTheme.caption!.copyWith(
                        color: Colors.green,
                      ),
                ),
        ],
      ),
    );
  }
}
