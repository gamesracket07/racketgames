
import 'package:get/get.dart';

import '../basepage/basePageController.dart';
import 'daily_cashflow_controller.dart';

class DailyCashflowBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the CounterController when the app starts

    Get.lazyPut<DailyCashflowController>(() => DailyCashflowController());
  }
}