// lib/app/modules/auth/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../data/models/matchResponseDto.dart';
import '../../../data/models/player_model.dart';
import '../../../routes/app_routes.dart';


class AuthController extends GetxController {
  final isLoading = false.obs;
  final currentPlayer = Rxn<Player>();

  // Login form controllers
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  // Signup form controllers
  final signupNameController = TextEditingController();
  final signupEmailController = TextEditingController();
  final signupPhoneController = TextEditingController();
  final signupPasswordController = TextEditingController();
  final signupConfirmPasswordController = TextEditingController();

  Future<void> login() async {
    if (!_validateLoginForm()) return;

    try {
      isLoading.value = true;
      // TODO: Implement actual login API call
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      // Simulate successful login
      currentPlayer.value = Player(
        id: 1,
        email: loginEmailController.text,
        name: 'Test Player',
        phone: '',
       country: '',
       rank: 0,
       gender: '',
       individualScore: 0,
       gamesPlayed: 0,
       gamesWon: 0,
       winPercentage: 0,
       // createdAt: DateTime.now(),
        team: '',

      );

      Get.offAllNamed(Routes.HOME);
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

  Future<void> signup() async {
    if (!_validateSignupForm()) return;

    try {
      isLoading.value = true;
      // TODO: Implement actual signup API call
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      // Simulate successful signup
      currentPlayer.value = Player(
        id: DateTime.now().millisecondsSinceEpoch,
        email: signupEmailController.text,
        name: signupNameController.text,
        phone: signupPhoneController.text,
        //createdAt: DateTime.now(),
        team: '',
        country: '',
        rank: 0,
        gender: '',
        individualScore: 0,
      );

      Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        'Signup failed: ${e.toString()}',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  bool _validateLoginForm() {
    if (loginEmailController.text.isEmpty || !GetUtils.isEmail(loginEmailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }
    if (loginPasswordController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your password');
      return false;
    }
    return true;
  }

  bool _validateSignupForm() {
    if (signupNameController.text.isEmpty) {
      Get.snackbar('Error', 'Please enter your name');
      return false;
    }
    if (!GetUtils.isEmail(signupEmailController.text)) {
      Get.snackbar('Error', 'Please enter a valid email');
      return false;
    }
    if (!GetUtils.isPhoneNumber(signupPhoneController.text)) {
      Get.snackbar('Error', 'Please enter a valid phone number');
      return false;
    }
    if (signupPasswordController.text.length < 6) {
      Get.snackbar('Error', 'Password must be at least 6 characters');
      return false;
    }
    if (signupPasswordController.text != signupConfirmPasswordController.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    signupNameController.dispose();
    signupEmailController.dispose();
    signupPhoneController.dispose();
    signupPasswordController.dispose();
    signupConfirmPasswordController.dispose();
    super.onClose();
  }

  void logout() {

  }
}