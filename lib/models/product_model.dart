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

  final String id;
  final String productName;
  final double price;
  final int quantity;
  final double fullPrice;
  final DateTime timestamp;

  static double changeFullPrice(double price, int quantity) {
    return price * quantity;
  }

  static String formatCurrency(double value) {
    final String real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$').format(value);
    return real;
  }
}
