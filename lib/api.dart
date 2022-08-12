import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_rate/view_model.dart';

class MoneyApi {
  Future<Map<String, dynamic>> getMoneyRates(String query) async {
    Uri url = Uri.parse(
        'https://v6.exchangerate-api.com/v6/95fc577304bbec77d7aa457c/latest/$query');

    http.Response response = await http.get(url);
    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    if (json['conversion_rates'] == null) {
      return {};
    }
    Map<String, dynamic> moneyRates = json['conversion_rates'];
    return moneyRates;
  }
}
