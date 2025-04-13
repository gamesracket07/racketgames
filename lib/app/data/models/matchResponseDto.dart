import 'dart:convert';

import 'package:racketgames/app/data/models/player_model.dart';

class MatchResponseDto {
  Match match;

  MatchResponseDto({
    required this.match,
  });

  MatchResponseDto copyWith({
    Match? match,
  }) =>
      MatchResponseDto(
        match: match ?? this.match,
      );

  factory MatchResponseDto.fromRawJson(String str) => MatchResponseDto.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MatchResponseDto.fromJson(Map<String, dynamic> json) => MatchResponseDto(
    match: Match.fromJson(json["match"]),
  );

  Map<String, dynamic> toJson() => {
    "match": match.toJson(),
  };
}

class Match {
  int matchId;
  DateTime date;
  String time;
  String venue;
  List<Player> players;
  String matchType;
  int currentSet;
  Score score;
  String status;
  List<IndividualPoint> individualPoints;

  Match({
    required this.matchId,
    required this.date,
    required this.time,
    required this.venue,
    required this.players,
    required this.matchType,
    required this.currentSet,
    required this.score,
    required this.status,
    required this.individualPoints,
  });

  Match copyWith({
    int? matchId,
    DateTime? date,
    String? time,
    String? venue,
    List<Player>? players,
    String? matchType,
    int? currentSet,
    Score? score,
    String? status,
    List<IndividualPoint>? individualPoints,
  }) =>
      Match(
        matchId: matchId ?? this.matchId,
        date: date ?? this.date,
        time: time ?? this.time,
        venue: venue ?? this.venue,
        players: players ?? this.players,
        matchType: matchType ?? this.matchType,
        currentSet: currentSet ?? this.currentSet,
        score: score ?? this.score,
        status: status ?? this.status,
        individualPoints: individualPoints ?? this.individualPoints,
      );

  factory Match.fromRawJson(String str) => Match.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Match.fromJson(Map<String, dynamic> json) => Match(
    matchId: json["match_id"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    venue: json["venue"],
    players: List<Player>.from(json["players"].map((x) => Player.fromJson(x))),
    matchType: json["match_type"],
    currentSet: json["current_set"],
    score: Score.fromJson(json["score"]),
    status: json["status"],
    individualPoints: List<IndividualPoint>.from(json["individual_points"].map((x) => IndividualPoint.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "match_id": matchId,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "venue": venue,
    "players": List<dynamic>.from(players.map((x) => x.toJson())),
    "match_type": matchType,
    "current_set": currentSet,
    "score": score.toJson(),
    "status": status,
    "individual_points": List<dynamic>.from(individualPoints.map((x) => x.toJson())),
  };
}

class IndividualPoint {
  int playerId;
  int pointsScored;

  IndividualPoint({
    required this.playerId,
    required this.pointsScored,
  });

  IndividualPoint copyWith({
    int? playerId,
    int? pointsScored,
  }) =>
      IndividualPoint(
        playerId: playerId ?? this.playerId,
        pointsScored: pointsScored ?? this.pointsScored,
      );

  factory IndividualPoint.fromRawJson(String str) => IndividualPoint.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IndividualPoint.fromJson(Map<String, dynamic> json) => IndividualPoint(
    playerId: json["player_id"],
    pointsScored: json["points_scored"],
  );

  Map<String, dynamic> toJson() => {
    "player_id": playerId,
    "points_scored": pointsScored,
  };
}
//
// class Player {
//   int id;
//   String name;
//   String team;
//   String country;
//   int rank;
//   String gender;
//    int individualScore;
//
//   Player({
//     required this.id,
//     required this.name,
//     required this.team,
//     required this.country,
//     required this.rank,
//     required this.gender,
//     required this.individualScore,
//   });
//
//   Player copyWith({
//     int? id,
//     String? name,
//     String? team,
//     String? country,
//     int? rank,
//     String? gender,
//     int? individualScore,
//   }) =>
//       Player(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         team: team ?? this.team,
//         country: country ?? this.country,
//         rank: rank ?? this.rank,
//         gender: gender ?? this.gender,
//         individualScore: individualScore ?? this.individualScore,
//       );
//
//   factory Player.fromRawJson(String str) => Player.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Player.fromJson(Map<String, dynamic> json) => Player(
//     id: json["id"],
//     name: json["name"],
//     team: json["team"],
//     country: json["country"],
//     rank: json["rank"],
//     gender: json["gender"],
//     individualScore: json["individual_score"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "team": team,
//     "country": country,
//     "rank": rank,
//     "gender": gender,
//     "individual_score": individualScore,
//   };
// }

class Score {
  int teamAlphaScore;
  int teamBetaScore;

  Score({
    required this.teamAlphaScore,
    required this.teamBetaScore,
  });

  Score copyWith({
    int? teamAlphaScore,
    int? teamBetaScore,
  }) =>
      Score(
        teamAlphaScore: teamAlphaScore ?? this.teamAlphaScore,
        teamBetaScore: teamBetaScore ?? this.teamBetaScore,
      );

  factory Score.fromRawJson(String str) => Score.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    teamAlphaScore: json["team_alpha_score"],
    teamBetaScore: json["team_beta_score"],
  );

  Map<String, dynamic> toJson() => {
    "team_alpha_score": teamAlphaScore,
    "team_beta_score": teamBetaScore,
  };
}
