import 'package:flutter/material.dart';
import 'package:money_rate/api.dart';
import 'package:money_rate/view_model.dart';
import 'country_model.dart';

class MoneyRatesProvider extends ChangeNotifier {
  final moneyApi = MoneyApi();

  Map<String, dynamic> moneyRates = {};
  List<String> shownList = [];
  List<Country> nations = [];

  Future fetchMoneyRates(String query) async {
    moneyRates = await moneyApi.getMoneyRates(query);
    shownList = moneyRates.keys.toList();
    nations = await moneyApi.getNationName();
    notifyListeners();
  }

  String findCountryName(String query) {
    String findCountry = '';
    nations
        .where((element) => element.currencyCode == query)
        .toList()
        .forEach((element) {
      findCountry = element.country;
    });
    return findCountry;
  }

  String findImageUrl (String query) {
    String imageUrl = '';
    nations
    .where((element) => element.currencyCode == query)
    .toList()
    .forEach((element) {imageUrl=element.imageUrl;
    });
    return imageUrl;
  }
}
