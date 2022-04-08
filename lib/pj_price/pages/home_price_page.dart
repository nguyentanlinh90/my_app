import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/widgets/app_large_text.dart';
import 'package:my_app/widgets/app_text.dart';

class ProductInfo {
  final String name;
  final double price;

  ProductInfo(this.name, this.price);
}

List products = [
  ProductInfo("Prd 1", 3),
  ProductInfo("Prd 2", 5),
  ProductInfo("Prd 3", 20),
  ProductInfo("Prd 4", 8),
  ProductInfo("Prd 5", 1000),
];

class HomePricePage extends StatefulWidget {
  const HomePricePage({Key? key}) : super(key: key);

  @override
  State<HomePricePage> createState() => _HomePricePageState();
}

class _HomePricePageState extends State<HomePricePage> {
  int _currentProductIndex = 0;
  int? _inputtedPrice;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              AppLargeText(text: products[_currentProductIndex].name),
              TextField(
                key: const Key('priceInput'),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  _inputtedPrice = int.tryParse(value);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _result =
                      _inputtedPrice == products[_currentProductIndex].price
                          ? 'pass'
                          : 'fail';
                    });
                  },
                  child: const AppText(
                    text: 'Check',
                  )),
              Visibility(
                visible: _result.isNotEmpty,
                child: AppLargeText(
                  text: _result,
                  key: const Key('result'),
                ),
              ),
              Visibility(
                visible: _result.isNotEmpty,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _result = '';
                        if (_currentProductIndex < 4) {
                          _currentProductIndex++;
                        }
                      });
                    },
                    child: AppText(
                      text: 'Next',
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
