import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorHandler {
  static void handleError(dynamic error) {
    Get.snackbar(
      'Error',
      error.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}