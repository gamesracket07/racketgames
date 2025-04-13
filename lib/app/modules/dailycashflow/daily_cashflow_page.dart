import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../basepage/basePage.dart';
import 'daily_cashflow_controller.dart';


class DailyCashflowPage extends GetView<DailyCashflowController> {
 // final AmountController amountController = Get.put(AmountController());

  @override
  Widget build(BuildContext context) {
    return BasePage(

      body:    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cash Amount Input
          Text("Cash Amount", style: TextStyle(fontSize: 18)),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Cash Amount"),
            onChanged: (value) {
              if (value.isNotEmpty) {
                controller.updateCashAmount(double.parse(value));
              } else {
                controller.updateCashAmount(0);
              }
            },
          ),
          SizedBox(height: 16),

          // Online Amount Input
          Text("Online Amount", style: TextStyle(fontSize: 18)),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter Online Amount"),
            onChanged: (value) {
              if (value.isNotEmpty) {
                controller.updateOnlineAmount(double.parse(value));
              } else {
                controller.updateOnlineAmount(0);
              }
            },
          ),
          SizedBox(height: 32),

          // Total Amount
          Obx(() {
            return Text(
              "Total Amount: ${controller.totalAmount.value.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            );
          }),
        ],
      ),
    );
  }
}
