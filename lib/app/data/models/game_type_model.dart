// lib/app/data/models/game_type_model.dart
class GameType {
  final String id;
  final String name;
  final String icon;
  final List<String> scoringRules;
  final int pointsToWin;
  final bool requiresTwoPointLead;
  final int maxSets;

  GameType({
    required this.id,
    required this.name,
    required this.icon,
    required this.scoringRules,
    required this.pointsToWin,
    required this.requiresTwoPointLead,
    required this.maxSets,
  });

  static List<GameType> getGameTypes() {
    return [
      GameType(
        id: 'badminton',
        name: 'Badminton',
        icon: '🏸',
        scoringRules: [
          'First to 21 points wins',
          'Must win by 2 points',
          'Best of 3 sets',
        ],
        pointsToWin: 21,
        requiresTwoPointLead: true,
        maxSets: 3,
      ),
      GameType(
        id: 'tennis',
        name: 'Tennis',
        icon: '🎾',
        scoringRules: [
          'Standard tennis scoring',
          '6 games to win a set',
          'Tiebreak at 6-6',
        ],
        pointsToWin: 4,
        requiresTwoPointLead: true,
        maxSets: 3,
      ),
      GameType(
        id: 'paddle',
        name: 'Paddle',
        icon: '🏓',
        scoringRules: [
          'First to 11 points wins',
          'Must win by 2 points',
          'Best of 5 sets',
        ],
        pointsToWin: 11,
        requiresTwoPointLead: true,
        maxSets: 5,
      ),
    ];
  }
}