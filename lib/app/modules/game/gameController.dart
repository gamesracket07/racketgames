import 'package:get/get.dart';

import '../../widgets/scoreBoardWidget/ScoreBoardWidgetController.dart';
import '../basepage/basePageController.dart';

class GameController extends BasePageController {

RxInt selectedValue=1.obs;
ScoreBoardWidgetController scoreBoardWidgetController=ScoreBoardWidgetController();

@override
void onInit() {
  super.onInit();
  scoreBoardWidgetController.onInit();
  selectedValue=1.obs;
}
// Method to handle chip selection
  void selectChip(int value) {
    selectedValue.value = value;
    update();// Update selected value
  }
}