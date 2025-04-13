import 'package:get/get.dart';

import '../basepage/basePageController.dart';

class DailyCashflowController extends BasePageController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  var cashAmount = 0.0.obs;
  var onlineAmount = 0.0.obs;
  var totalAmount = 0.0.obs;

  // Function to update total amount whenever cash or online amount changes
  void calculateTotalAmount() {
    totalAmount.value = cashAmount.value + onlineAmount.value;
  }

  // Function to update cash amount
  void updateCashAmount(double amount) {
    cashAmount.value = amount;
    calculateTotalAmount();
  }

  // Function to update online amount
  void updateOnlineAmount(double amount) {
    onlineAmount.value = amount;
    calculateTotalAmount();
  }
}
