import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:money_rate/view_model.dart';

class MoneyApi {
  MoneyApi() {
    fetchRates('');
  }

  final _ratesStreamController = StreamController<List<MoneyViewModel>>();

  Stream<List<MoneyViewModel>> get ratesStream => _ratesStreamController.stream;

  Future fetchRates(String query) async {
    List<MoneyViewModel> rates = await getRates(query);
    _ratesStreamController.add(rates);
  }

  Future<List<MoneyViewModel>> getRates(String query) async {
    Uri url = Uri.parse(
        'https://v6.exchangerate-api.com/v6/95fc577304bbec77d7aa457c/latest/$query');

    http.Response response = await http.get(url);

    String jsonString = response.body;

    Map<String, dynamic> json = jsonDecode(jsonString);
    List<dynamic> hits = json['hits'];
    return hits.map((e) => MoneyViewModel.fromJson(e)).toList();
  }
}