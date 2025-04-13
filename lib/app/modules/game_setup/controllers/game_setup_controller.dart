// lib/app/modules/game_setup/controllers/game_setup_controller.dart
import 'package:get/get.dart';
import '../../../data/models/game_type_model.dart';
import '../../../data/models/player_model.dart';

class GameSetupController extends GetxController {
  final selectedGameType = Rxn<GameType>();
  final isDoublesGame = false.obs;
  final teamAPlayer1 = Rxn<Player>();
  final teamAPlayer2 = Rxn<Player>();
  final teamBPlayer1 = Rxn<Player>();
  final teamBPlayer2 = Rxn<Player>();

  final gameTypes = GameType.getGameTypes();

  void selectGameType(GameType type) {
    selectedGameType.value = type;
  }

  void toggleGameMode() {
    isDoublesGame.value = !isDoublesGame.value;
    // Reset player selections for team 2 when switching modes
    if (!isDoublesGame.value) {
      teamAPlayer2.value = null;
      teamBPlayer2.value = null;
    }
  }

  bool canStartGame() {
    if (selectedGameType.value == null) return false;

    if (isDoublesGame.value) {
      return teamAPlayer1.value != null &&
          teamAPlayer2.value != null &&
          teamBPlayer1.value != null &&
          teamBPlayer2.value != null;
    }

    return teamAPlayer1.value != null && teamBPlayer1.value != null;
  }

  void startGame() {
    if (!canStartGame()) return;

    final gameConfig = {
      'gameType': selectedGameType.value!.id,
      'isDoubles': isDoublesGame.value,
      'teamAPlayer1': teamAPlayer1.value!.id,
      'teamAPlayer2': isDoublesGame.value ? teamAPlayer2.value!.id : null,
      'teamBPlayer1': teamBPlayer1.value!.id,
      'teamBPlayer2': isDoublesGame.value ? teamBPlayer2.value!.id : null,
    };

    Get.toNamed('/game-play', arguments: gameConfig);
  }
}