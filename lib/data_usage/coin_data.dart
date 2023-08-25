import 'package:flutter/material.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  List<DropdownMenuItem<String>> currenciesToItemsList() {
    List<DropdownMenuItem<String>> items =
        List<DropdownMenuItem<String>>.filled(
      currenciesList.length,
      const DropdownMenuItem<String>(
        value: 'USD',
        child: Text('USD'),
      ),
    );
    for (int i = 0; i < currenciesList.length; i++) {
      items[i] = DropdownMenuItem<String>(
        value: currenciesList[i],
        child: Text(currenciesList[i]),
      );
    }
    return items;
  }
}
