class MoneyViewModel {
  final String conversionrates;
  final String basecode;

  MoneyViewModel({required this.conversionrates, required this.basecode});

  factory MoneyViewModel.fromJson(Map<String, dynamic> json) {
    return MoneyViewModel(
      conversionrates: json['conversion_rates'] as String,
      basecode: json['base_code'] as String
    );
  }
}