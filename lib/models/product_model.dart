import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ProductModel {
  ProductModel({
    this.id = '',
    required this.productName,
    required this.price,
    required this.quantity,
    required this.fullPrice,
    required this.timestamp,
  });

  factory ProductModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ProductModel(
      id: doc.id,
      productName: doc['productName'].toString(),
      quantity: int.parse(doc['quantity'].toString()),
      price: double.parse(doc['price'].toString()),
      fullPrice: double.parse(doc['fullPrice'].toString()),
      timestamp: DateTime.parse(doc['timestamp'].toDate().toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'fullPrice': fullPrice,
      'timestamp': timestamp,
    };
  }

  final String id;
  final String productName;
  final double price;
  final int quantity;
  final double fullPrice;
  final DateTime timestamp;

  static double changeFullPrice(double price, int quantity) {
    return quantity * price;
  }

  static String formatCurrency(double value) {
    final String real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$').format(value);
    return real;
  }
}
