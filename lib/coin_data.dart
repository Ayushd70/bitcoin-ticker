import 'dart:convert';

import 'package:http/http.dart' as http;

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

const coinAPIURL = 'https://api.binance.com/api/v3/ticker/price';
var cryptoList = <String>[];

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    var response = await http.get(Uri.parse(coinAPIURL));
    Map<String, String> cryptoPrices = {};

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      if (decodeData != null) {
        decodeData.forEach((e) {
          cryptoList.add(e['symbol']);
          cryptoPrices[e['symbol']] = e['price'];
        });
      } else {
          print(response.statusCode);
          throw 'Error getting the requested url';
	      }
    }
    return cryptoPrices;
  }
}
