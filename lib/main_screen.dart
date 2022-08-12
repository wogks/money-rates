import 'package:flutter/material.dart';
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
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: _buildAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  viewModel.fetchMoneyRates(_controller.text);
                },
                child: const Icon(Icons.search),
              ),
              hintText: '검색어 입력',
            ),
          ),
          Row(
            children: [
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    color: Colors.red,
                    child: const Text('Contry Name'),
                  )),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.blue,
                  child: const Text('Currency'),
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  color: Colors.green,
                  child: const Text('Money Rates'),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.shownList.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              viewModel
                                  .findImageUrl(viewModel.shownList[index]),
                              width: 30,
                              height: 20,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Text(
                                viewModel.findCountryName(
                                  viewModel.shownList[index],
                                ),
                                overflow: TextOverflow.fade,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(viewModel.shownList[index]),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          viewModel.moneyRates[viewModel.shownList[index]]
                          .toString()
                              ,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
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
    );
  }
}
