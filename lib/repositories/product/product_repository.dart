import 'package:market_list/models/product_model.dart';

abstract class ProductRepository {
  Stream<List<ProductModel>> readAll(String userId);
  Future<void> save(String userId, ProductModel product);
  Future<void> update(String userId, ProductModel product);
  Future<void> remove(String userId, ProductModel product);
  Future<void> removeAll(String userId);
}
