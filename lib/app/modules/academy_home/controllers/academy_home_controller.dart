// lib/app/modules/academy_home/controllers/academy_home_controller.dart
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class AcademyHomeController extends GetxController {
  // Example stats
  final totalStudents = 120.obs;
  final presentToday = 110.obs;
  final absentToday = 10.obs;

  void goToStudentList() {
    Get.toNamed(Routes.ACADEMY_STUDENTS);
  }

  void goToAttendance() {
    Get.toNamed(Routes.ACADEMY_ATTENDANCE);
  }
  void goToFees() {
    Get.toNamed(Routes.ACADEMY_FEES);
  }
}