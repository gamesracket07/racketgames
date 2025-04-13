class Score {
  final int teamAlphaScore;
  final int teamBetaScore;

  Score({
    required this.teamAlphaScore,
    required this.teamBetaScore,
  });

  factory Score.fromJson(Map<String, dynamic> json) {
    return Score(
      teamAlphaScore: json['team_alpha_score'],
      teamBetaScore: json['team_beta_score'],
    );
  }
}
