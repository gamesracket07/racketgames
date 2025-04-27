// lib/app/modules/academy_attendance/bindings/academy_attendance_binding.dart
import 'package:get/get.dart';
import '../controllers/academy_attendance_controller.dart';

class AcademyAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AcademyAttendanceController>(() => AcademyAttendanceController());
  }
}