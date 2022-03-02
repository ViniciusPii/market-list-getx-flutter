import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:market_list/core/auth/auth_service.dart';
import 'package:market_list/repositories/image_storage/image_storage_repository.dart';
import 'package:market_list/repositories/image_storage/image_storage_repository_impl.dart';
import 'package:market_list/repositories/product/product_repository.dart';
import 'package:market_list/repositories/product/product_repository_impl.dart';
import 'package:market_list/repositories/user/user_repository.dart';
import 'package:market_list/repositories/user/user_repository_impl.dart';
import 'package:market_list/services/image_storage/image_storage_service.dart';
import 'package:market_list/services/image_storage/image_storage_service_impl.dart';
import 'package:market_list/services/product/product_service.dart';
import 'package:market_list/services/product/product_service_impl.dart';
import 'package:market_list/services/user/user_service.dart';
import 'package:market_list/services/user/user_service_impl.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => FirebaseFirestore.instance,
      fenix: true,
    );

    Get.lazyPut(
      () => FirebaseAuth.instance,
      fenix: true,
    );

    Get.lazyPut(
      () => FirebaseStorage.instance,
      fenix: true,
    );

    Get.put(
      AuthService(
        auth: Get.find(),
      ),
    ).authentication();

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
      fenix: true,
    );

    Get.lazyPut<UserRepository>(
      () => UserRepositoryImpl(
        auth: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<UserService>(
      () => UserServiceImpl(
        userRepository: Get.find(),
        imageStorageRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<ImageStorageRepository>(
      () => ImageStorageRepositoryImpl(
        storage: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<ImageStorageService>(
      () => ImageStorageServiceImpl(
        imageStorageRepository: Get.find(),
      ),
      fenix: true,
    );
  }
}
