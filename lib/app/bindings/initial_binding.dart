// lib/app/bindings/initial_binding.dart
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Register global dependencies
    Get.lazyPut(() => ApiClient(), fenix: true);
    Get.lazyPut(() => StorageService(), fenix: true);
  }
}

class ApiClient {
}

class StorageService {
}