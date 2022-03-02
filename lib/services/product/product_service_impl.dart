import 'package:market_list/models/product_model.dart';

import '/repositories/product/product_repository.dart';

import 'product_service.dart';

class ProductServiceImpl implements ProductService {
  ProductServiceImpl({
    required ProductRepository productRepository,
  }) : _productRepository = productRepository;

  final ProductRepository _productRepository;

  @override
  Stream<List<ProductModel>> readAll(String userId) => _productRepository.readAll(userId);

  @override
  Future<void> save(String userId, ProductModel product) =>
      _productRepository.save(userId, product);

  @override
  Future<void> update(String userId, ProductModel product) =>
      _productRepository.update(userId, product);

  @override
  Future<void> remove(String userId, ProductModel product) =>
      _productRepository.remove(userId, product);

  @override
  Future<void> removeAll(String userId) => _productRepository.removeAll(userId);
}
