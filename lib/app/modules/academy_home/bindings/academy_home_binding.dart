// lib/app/modules/academy_home/bindings/academy_home_binding.dart
import 'package:get/get.dart';
import '../controllers/academy_home_controller.dart';

class AcademyHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademyHomeController>(() => AcademyHomeController());
  }
}