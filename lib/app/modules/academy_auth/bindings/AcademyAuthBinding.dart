// lib/app/modules/academy_auth/bindings/academy_auth_binding.dart
import 'package:get/get.dart';
import '../controllers/academy_auth_controller.dart';

class AcademyAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademyAuthController>(() => AcademyAuthController());
  }
}