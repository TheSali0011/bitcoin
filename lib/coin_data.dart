import 'dart:convert';
import 'package:http/http.dart'as http;
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
  'ZAR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const coinurl = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = 'D1A7FD40-5FB4-403F-8F28-2FCCEC755562';
class CoinData{
  Future? getCoinData(String selectedcurrency)async{
    Map<String,String> cryptoprices={};
    for(String crypto in cryptoList){
      String requestUrl = '$coinurl/$crypto/$selectedcurrency?apikey=$apikey';
      http.Response response=await http.get(Uri.parse(requestUrl));
    if(response.statusCode==200){
      var decodeData=jsonDecode(response.body);
      double lastPrice=decodeData['rate'];
      cryptoprices[crypto]=lastPrice.toStringAsFixed(0);
    }else {
      response.statusCode;
      throw 'Problem with the request';
    }
    }
    return cryptoprices;
  }
}


