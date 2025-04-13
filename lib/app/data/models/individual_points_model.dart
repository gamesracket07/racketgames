class IndividualPoint {
  final int playerId;
  final int pointsScored;

  IndividualPoint({
    required this.playerId,
    required this.pointsScored,
  });

  factory IndividualPoint.fromJson(Map<String, dynamic> json) {
    return IndividualPoint(
      playerId: json['player_id'],
      pointsScored: json['points_scored'],
    );
  }
}
