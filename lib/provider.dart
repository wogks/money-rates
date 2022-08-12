import 'package:flutter/material.dart';
import 'package:money_rate/api.dart';
import 'package:money_rate/view_model.dart';

class MoneyRatesProvider extends ChangeNotifier {

  final moneyApi = MoneyApi();

  Map<String, dynamic> moneyRates = {};
  List<String> shownList = [];

  Future fetchMoneyRates(String query) async {
    moneyRates = await moneyApi.getMoneyRates(query);
    shownList = moneyRates.keys.toList();
    notifyListeners();
  }
}