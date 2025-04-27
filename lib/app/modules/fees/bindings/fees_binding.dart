// lib/app/modules/fees/bindings/fees_binding.dart
import 'package:get/get.dart';
import '../controllers/fees_controller.dart';

class FeesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FeesController>(() => FeesController());
  }
}