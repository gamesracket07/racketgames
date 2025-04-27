// lib/app/modules/academy_students/bindings/academy_students_binding.dart
import 'package:get/get.dart';
import '../controllers/academy_students_controller.dart';

class AcademyStudentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademyStudentsController>(() => AcademyStudentsController());
  }
}