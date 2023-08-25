import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data_usage/coin_data.dart';
import '../constants.dart';

class Picker {
  Picker({
    required this.changeCurrency,
    required this.changeRateState,
  });

  Function changeCurrency;
  Function changeRateState;

  CupertinoPicker getIosPicker() {
    return CupertinoPicker.builder(
      scrollController: FixedExtentScrollController(initialItem: 19),
      itemExtent: 32.0,
      onSelectedItemChanged: (int selectedIndex) {
        changeCurrency(currenciesList[selectedIndex]);
        for (String bitcoinType in cryptoList) {
          changeRateState(bitcoinType);
        }
      },
      childCount: currenciesList.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(
          child: Text(
            currenciesList[index],
            style: kTextStyle,
          ),
        );
      },
    );
  }

  DropdownButton<String> getAndroidPicker(
    String currency,
  ) {
    return DropdownButton<String>(
      style: kTextStyle,
      value: currency,
      onChanged: (value) {
        changeCurrency(value!);
        currency = value;
        for (String bitcoinType in cryptoList) {
          changeRateState(bitcoinType);
        }
      },
      items: CoinData().currenciesToItemsList(),
    );
  }
}
