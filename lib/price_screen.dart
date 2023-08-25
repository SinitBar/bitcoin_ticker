import 'package:bitcoin_ticker/components/pickers.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'components/bitcoin_card.dart';
import 'data_usage/coin_data.dart';
import 'data_usage/http_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currency = 'USD';
  Map rates = {
    'BTC': '?',
    'ETH': '?',
    'LTC': '?',
  };

  void changeCurrency(String value) {
    currency = value;
  }

  void changeRateState(String bitcoinType) async {
    String newRate = await getBitcoinRate(
      bitcoinType: bitcoinType,
      currency: currency,
    );
    setState(() {
      rates[bitcoinType] = newRate;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      currency = 'USD'; // first change currency
      for (String bitcoinType in cryptoList) {
        changeRateState(bitcoinType);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Picker picker = Picker(
      changeCurrency: (String value) {
        changeCurrency(value);
      },
      changeRateState: (String bitcoinType) {
        changeRateState(bitcoinType);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          BitcoinCard(
            bitcoinType: cryptoList[0],
            rate: rates['BTC'],
            currency: currency,
          ),
          BitcoinCard(
            bitcoinType: cryptoList[1],
            rate: rates['ETH'],
            currency: currency,
          ),
          BitcoinCard(
            bitcoinType: cryptoList[2],
            rate: rates['LTC'],
            currency: currency,
          ),
          Expanded(
            flex: 2,
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              color: Colors.grey.shade800,
              child: (Platform.isIOS
                  ? picker.getIosPicker()
                  : picker.getAndroidPicker(currency)),
            ),
          ),
        ],
      ),
    );
  }
}
