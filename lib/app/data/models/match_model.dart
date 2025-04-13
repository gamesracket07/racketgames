import 'dart:convert';

import 'player_model.dart';
import 'score_model.dart';
import 'individual_points_model.dart';

class MatchModel {
  final int matchId;
  final String date;
  final String time;
  final String venue;
  final List<Player> players;
  final String matchType;
  final int currentSet;
  final Score score;
  final String status;
  final List<IndividualPoint> individualPoints;

  MatchModel({
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

  factory MatchModel.fromJson(Map<String, dynamic> json) {
    return MatchModel(
      matchId: json['match_id'],
      date: json['date'],
      time: json['time'],
      venue: json['venue'],
      players: (json['players'] as List)
          .map((playerJson) => Player.fromJson(playerJson))
          .toList(),
      matchType: json['match_type'],
      currentSet: json['current_set'],
      score: Score.fromJson(json['score']),
      status: json['status'],
      individualPoints: (json['individual_points'] as List)
          .map((pointJson) => IndividualPoint.fromJson(pointJson))
          .toList(),
    );
  }
}

