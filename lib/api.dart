import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:money_rate/country_model.dart';
import 'package:money_rate/data.dart';

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

  Future<List<Country>> getNationName() async {
    await Future.delayed(const Duration(seconds: 1));
    String jsonString = data;

    Iterable json = jsonDecode(jsonString);
    return json.map((e) => Country.fromJson(e)).toList();
  }
}
