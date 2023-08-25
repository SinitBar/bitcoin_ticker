import 'package:flutter/material.dart';
import '../constants.dart';

class BitcoinCard extends StatelessWidget {
  const BitcoinCard({
    super.key,
    required this.bitcoinType,
    required this.rate,
    required this.currency,
  });

  final String bitcoinType;
  final String rate;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.grey.shade700,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $bitcoinType = $rate $currency',
              textAlign: TextAlign.center,
              style: kTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
