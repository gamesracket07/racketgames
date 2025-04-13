// lib/app/modules/game_setup/views/game_setup_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/game_type_model.dart';
import '../../../data/models/player_model.dart';
import '../controllers/game_setup_controller.dart';

class GameSetupPage extends GetView<GameSetupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Game'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildGameTypeSelector(),
            _buildGameModeSelector(),
            _buildPlayerSelection(),
            _buildStartGameButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildGameTypeSelector() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Game Type',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.gameTypes.length,
            itemBuilder: (context, index) {
              final gameType = controller.gameTypes[index];
              return Obx(() => _buildGameTypeCard(
                gameType: gameType,
                isSelected: controller.selectedGameType.value?.id == gameType.id,
              ));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildGameTypeCard({
    required GameType gameType,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => controller.selectGameType(gameType),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              gameType.icon,
              style: TextStyle(fontSize: 32),
            ),
            SizedBox(height: 8),
            Text(
              gameType.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameModeSelector() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Game Mode',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Obx(() => Row(
            children: [
              Expanded(
                child: _buildModeCard(
                  title: 'Singles',
                  icon: Icons.person,
                  isSelected: !controller.isDoublesGame.value,
                  onTap: () => controller.isDoublesGame.value = false,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: _buildModeCard(
                  title: 'Doubles',
                  icon: Icons.group,
                  isSelected: controller.isDoublesGame.value,
                  onTap: () => controller.isDoublesGame.value = true,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  Widget _buildModeCard({
    required String title,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? Colors.blue : Colors.grey,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlayerSelection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Select Players',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildTeamSection(
            teamName: 'Team A',
            player1: controller.teamAPlayer1,
            player2: controller.teamAPlayer2,
            onSelectPlayer1: () => _showPlayerSelection(1, true),
            onSelectPlayer2: () => _showPlayerSelection(2, true),
          ),
          SizedBox(height: 24),
          _buildTeamSection(
            teamName: 'Team B',
            player1: controller.teamBPlayer1,
            player2: controller.teamBPlayer2,
            onSelectPlayer1: () => _showPlayerSelection(1, false),
            onSelectPlayer2: () => _showPlayerSelection(2, false),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection({
    required String teamName,
    required Rxn<Player> player1,
    required Rxn<Player> player2,
    required VoidCallback onSelectPlayer1,
    required VoidCallback onSelectPlayer2,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          teamName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildPlayerSelector(
                player: player1,
                onTap: onSelectPlayer1,
                label: 'Player 1',
              ),
            ),
            SizedBox(width: 16),
            Obx(() => controller.isDoublesGame.value
                ? Expanded(
              child: _buildPlayerSelector(
                player: player2,
                onTap: onSelectPlayer2,
                label: 'Player 2',
              ),
            )
                : SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _buildPlayerSelector({
    required Rxn<Player> player,
    required VoidCallback onTap,
    required String label,
  }) {
    return Obx(() => InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.1),
              child: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                player.value?.name ?? label,
                style: TextStyle(
                  color: player.value != null ? Colors.black87 : Colors.grey,
                ),
              ),
            ),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    ));
  }

  Widget _buildStartGameButton() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Obx(() => ElevatedButton(
        onPressed: controller.canStartGame() ? controller.startGame : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          'Start Game',
          style: TextStyle(fontSize: 16),
        ),
      )),
    );
  }

  void _showPlayerSelection(int playerNumber, bool isTeamA) {
    // Implement player selection dialog/page
    Get.toNamed('/player-selection', arguments: {
      'teamA': isTeamA,
      'playerNumber': playerNumber,
    });
  }
}