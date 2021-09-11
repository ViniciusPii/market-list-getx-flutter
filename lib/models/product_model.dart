class ProductModel {
  ProductModel({
    required this.id,
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

  double changeFullPrice(double price, int quantity) {
    return price * quantity;
  }
}
