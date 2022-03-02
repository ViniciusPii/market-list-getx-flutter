import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:market_list/core/services/auth_service.dart';
import 'package:market_list/repositories/login_repository.dart';
import 'package:market_list/repositories/product/product_repository.dart';
import 'package:market_list/repositories/product/product_repository_impl.dart';
import 'package:market_list/services/product/product_service.dart';
import 'package:market_list/services/product/product_service_impl.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      AuthService(),
    ).init();

    Get.lazyPut(
      () => FirebaseFirestore.instance,
    );

    Get.lazyPut<ProductRepository>(
      () => ProductRepositoryImpl(
        firestore: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<ProductService>(
      () => ProductServiceImpl(
        productRepository: Get.find(),
      ),
    );

    Get.lazyPut(
      () => LoginRepository(),
      fenix: true,
    );
  }
}
