import 'package:flutter/material.dart';
import 'package:money_rate/api.dart';
import 'package:money_rate/view_model.dart';

class MoneyRatesProvider extends ChangeNotifier {

  final _moneyApi = MoneyApi();

  List<MoneyViewModel> moneyRates = [];

  bool isLoading = false;

  Future<void> fetchRates(String query) async {
    isLoading = true;
    notifyListeners();

    moneyRates = await _moneyApi.getRates(query);
    notifyListeners(); //상태 바뀔때마다 붙임

    isLoading = false;
    notifyListeners();
}
}