import 'package:flutter/material.dart';
import 'package:money_rate/view_model.dart';
import 'package:provider/provider.dart';
import 'package:money_rate/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MoneyRatesProvider>();

    return Scaffold(
      appBar: AppBar(
      actions: [
        IconButton(
          onPressed: () {
            setState(() {});
          },
          icon: const Icon(Icons.add),
          color: Colors.black,
        )
      ],
      backgroundColor: Colors.white,
      title: const Text('Exchange Rate', style: TextStyle(color: Colors.black)),
    ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  viewModel.fetchRates(_controller.text);
                },
                child: const Icon(Icons.search),
              ),
              hintText: '검색어 입력',
            ),
          )
        ],
      ),
    );
  }
}
