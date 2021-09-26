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
    required this.weight,
    this.isSelected = false,
  });

  factory ProductModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> doc) {
    return ProductModel(
      id: doc.id,
      productName: doc['productName'].toString(),
      quantity: int.parse(doc['quantity'].toString()),
      price: double.parse(doc['price'].toString()),
      fullPrice: double.parse(doc['fullPrice'].toString()),
      timestamp: DateTime.parse(doc['timestamp'].toDate().toString()),
      weight: double.parse(doc['weight'].toString()),
      isSelected: doc['isSelected'].toString() == 'true',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'fullPrice': fullPrice,
      'timestamp': timestamp,
      'weight': weight,
      'isSelected': isSelected,
    };
  }

  final String id;
  final String productName;
  final double price;
  final int quantity;
  final double fullPrice;
  final DateTime timestamp;
  final double weight;
  final bool isSelected;

  static double changeFullPriceQuantity(double price, int quantity) => quantity * price;

  static double changeFullPriceWeight(double price, double weight) => weight * price;

  static String formatCurrency(double value) =>
      NumberFormat.currency(locale: 'pt_BR', name: 'R\$', decimalDigits: 2).format(value);

  static String formatWeight(double value) =>
      NumberFormat.currency(locale: 'pt_BR', name: 'Kg ', decimalDigits: 3).format(value);

  static String formatGrams(double value) => (value * 1000).toStringAsFixed(0);
}
