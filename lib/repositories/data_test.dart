import 'package:market_list/models/product_model.dart';

class DataTest {
  final Map<String, ProductModel> listProducts = <String, ProductModel>{
    '1': ProductModel(
      id: '1',
      productName: 'Abacate',
      price: 7.99,
      quantity: 1,
      fullPrice: 7.99,
      timestamp: DateTime.now(),
    ),
    '2': ProductModel(
      id: '2',
      productName: 'Banana',
      price: 4.50,
      quantity: 2,
      fullPrice: 9,
      timestamp: DateTime.now(),
    ),
    '3': ProductModel(
      id: '3',
      productName: 'Tomate',
      price: 5.49,
      quantity: 1,
      fullPrice: 5.49,
      timestamp: DateTime.now(),
    ),
    '4': ProductModel(
      id: '4',
      productName: 'Veja',
      price: 3.50,
      quantity: 2,
      fullPrice: 7,
      timestamp: DateTime.now(),
    ),
    '5': ProductModel(
      id: '5',
      productName: 'Chá gelado',
      price: 5.50,
      quantity: 2,
      fullPrice: 11,
      timestamp: DateTime.now(),
    ),
  };
}
