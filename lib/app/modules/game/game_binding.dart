import 'package:get/get.dart';

import '../basepage/basePageController.dart';
import 'gameController.dart';


class GameBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the CounterController when the app starts
    Get.lazyPut<BasePageController>(() => BasePageController());
    Get.lazyPut<GameController>(() => GameController());
  }
}