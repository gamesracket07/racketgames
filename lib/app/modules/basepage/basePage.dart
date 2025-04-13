import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'basePageController.dart';


class BasePage extends GetView<BasePageController> {
  final Widget body;
  const BasePage({ required this.body});
  @override
  Widget build(BuildContext context) {
    // GetView automatically provides access to the controller
    return Scaffold(
      backgroundColor: Color(int.parse("0xFFf0f0f5")),
      appBar: AppBar(
        title: Text(controller.Title.value),
      ),
      body:
      Column(
        children: [
          Expanded(child: body), // This is the dynamic content area
          // The footer
        ],
      ),);
  }
}