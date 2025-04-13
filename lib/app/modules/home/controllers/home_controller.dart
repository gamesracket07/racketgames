// lib/app/modules/home/controllers/home_controller.dart
import 'package:get/get.dart';
import '../../../data/models/game_model.dart';
import '../../auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  final currentPlayer = Get.find<AuthController>().currentPlayer;
  final recentGames = <Game>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRecentGames();
  }

  Future<void> loadRecentGames() async {
    try {
      isLoading.value = true;
      // TODO: Implement API call to fetch recent games
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      // Dummy data for demonstration
      recentGames.value = Game.getDummyGames();
    } finally {
      isLoading.value = false;
    }
  }

  void startNewGame() {
  //  Get.toNamed('/game');
    Get.toNamed('/game-setup');
  }

  void viewProfile() {
    Get.toNamed('/profile');
  }

  void logout() {
   Get.find<AuthController>().logout();
    Get.offAllNamed('/login');
  }
}