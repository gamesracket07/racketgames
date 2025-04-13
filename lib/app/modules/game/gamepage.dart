import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/scoreBoardWidget/ScoreBoardWidget.dart';
import '../basepage/basePage.dart';
import 'gameController.dart';

class GamePage extends GetView<GameController> {
  @override
  Widget build(BuildContext context) {
    // GetView automatically provides access to the controller
return BasePage(
  body: Padding(padding: EdgeInsets.all(10),
  child:  ScoreBoardWidget(controller: controller.scoreBoardWidgetController,),)
 ,
);
  }
}

