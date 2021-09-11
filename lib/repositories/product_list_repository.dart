import 'package:flutter/material.dart';
import 'package:market_list/models/product_model.dart';

class ProductListRepository extends ChangeNotifier {
  ProductListRepository();

  final List<ProductModel> _productList = <ProductModel>[
    ProductModel(
      id: '1',
      productName: 'Abacate',
      price: 7.99,
      quantity: 1,
      fullPrice: 7.99,
      timestamp: DateTime.now(),
    ),
    ProductModel(
      id: '2',
      productName: 'Banana',
      price: 4.50,
      quantity: 2,
      fullPrice: 9,
      timestamp: DateTime.now(),
    ),
    ProductModel(
      id: '3',
      productName: 'Tomate',
      price: 5.49,
      quantity: 1,
      fullPrice: 5.49,
      timestamp: DateTime.now(),
    ),
    ProductModel(
      id: '4',
      productName: 'Veja',
      price: 3.50,
      quantity: 2,
      fullPrice: 7,
      timestamp: DateTime.now(),
    ),
    ProductModel(
      id: '5',
      productName: 'Chá gelado',
      price: 5.50,
      quantity: 2,
      fullPrice: 11,
      timestamp: DateTime.now(),
    ),
  ];

  List<ProductModel> get productList => _productList.reversed.toList();

  void add() {
    _productList.add(
      ProductModel(
        id: '6',
        productName: 'Abacaxi',
        price: 5.75,
        quantity: 1,
        fullPrice: 100,
        timestamp: DateTime.now(),
      ),
    );

    notifyListeners();
  }

  int listAmountsCalculate() {
    return _productList
        .map((ProductModel product) => product.quantity)
        .reduce((int firstValue, int lastValue) => firstValue + lastValue);
  }

  double listFullPriceCalculate() {
    return _productList
        .map((ProductModel product) => product.fullPrice)
        .reduce((double firstValue, double lastValue) => firstValue + lastValue);
  }
}
