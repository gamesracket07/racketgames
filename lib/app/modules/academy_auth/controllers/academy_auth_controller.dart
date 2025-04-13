// lib/app/modules/academy_auth/controllers/academy_auth_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../data/models/academy_user_model.dart';

class AcademyAuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final academyIdController = TextEditingController();

  final isLoading = false.obs;
  final currentUser = Rxn<AcademyUser>();
  final rememberMe = false.obs;

  Future<void> login() async {
    if (!_validateForm()) return;

    try {
      isLoading.value = true;

      // TODO: Implement actual API login
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      // Simulate successful login
      currentUser.value = AcademyUser(
        id: '1',
        name: 'John Doe',
        email: emailController.text,
        phone: '+1234567890',
        role: AcademyRole.coach,
        academyId: academyIdController.text,
        joinDate: DateTime.now(),
        permissions: {
          'manage_students': true,
          'view_schedules': true,
          'create_games': true,
        },
      );

      // Store credentials if remember me is checked
      if (rememberMe.value) {
        // TODO: Implement secure credential storage
      }

      Get.offAllNamed('/academy-dashboard');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Login failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateForm() {
    if (emailController.text.isEmpty || !GetUtils.isEmail(emailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }
    if (passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your password');
      return false;
    }
    if (academyIdController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your Academy ID');
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    academyIdController.dispose();
    super.onClose();
  }
}