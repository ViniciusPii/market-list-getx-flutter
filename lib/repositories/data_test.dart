import 'package:market_list/models/product_model.dart';

class DataTest {
  DataTest._();

  static List<ProductModel> listProducts = <ProductModel>[
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
}
