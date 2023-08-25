import 'package:http/http.dart';
import 'dart:convert';

const String coinApiKey = 'DE2D9259-1F2B-4E4D-BE6D-100D29F2650A';

Future<String> getBitcoinRate({
  required String bitcoinType,
  required String currency,
}) async {
  // 'https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=DE2D9259-1F2B-4E4D-BE6D-100D29F2650A';
  var url = Uri.https(
    'rest.coinapi.io',
    '/v1/exchangerate/$bitcoinType/$currency',
    {
      'apikey': coinApiKey,
    },
  );
  final respond = jsonDecode(await read(url));
  return await respond['rate'].toStringAsFixed(2);
}
