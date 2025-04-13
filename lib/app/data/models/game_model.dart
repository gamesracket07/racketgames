// lib/app/data/models/game_model.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Game {
  final String id;
  final DateTime date;
  final String teamAPlayer1;
  final String? teamAPlayer2;
  final String teamBPlayer1;
  final String? teamBPlayer2;
  final int teamAScore;
  final int teamBScore;
  final String gameType; // singles/doubles
  final String status; // ongoing/completed/cancelled
  final int duration; // in minutes
  final String? winningTeam; // 'A' or 'B'

  Game({
    required this.id,
    required this.date,
    required this.teamAPlayer1,
    this.teamAPlayer2,
    required this.teamBPlayer1,
    this.teamBPlayer2,
    required this.teamAScore,
    required this.teamBScore,
    required this.gameType,
    required this.status,
    required this.duration,
    this.winningTeam,
  });

  // Computed properties
  String get score => '$teamAScore-$teamBScore';

  bool get isDoubles => gameType == 'doubles';

  String get formattedDate =>
      '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';

  String get formattedDuration =>
      '${duration ~/ 60}h ${duration % 60}m';

  String get result {
    if (status != 'completed') return status.capitalizeFirst!;
    return winningTeam == 'A' ? 'Won' : 'Lost';
  }

  // Color coding for results
  Color get resultColor {
    switch (status) {
      case 'completed':
        return winningTeam == 'A' ? Colors.green : Colors.red;
      case 'ongoing':
        return Colors.blue;
      case 'cancelled':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  // Factory constructor from JSON
  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json['id'],
    date: DateTime.parse(json['date']),
    teamAPlayer1: json['teamAPlayer1'],
    teamAPlayer2: json['teamAPlayer2'],
    teamBPlayer1: json['teamBPlayer1'],
    teamBPlayer2: json['teamBPlayer2'],
    teamAScore: json['teamAScore'],
    teamBScore: json['teamBScore'],
    gameType: json['gameType'],
    status: json['status'],
    duration: json['duration'],
    winningTeam: json['winningTeam'],
  );

  // Convert to JSON
  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'teamAPlayer1': teamAPlayer1,
    'teamAPlayer2': teamAPlayer2,
    'teamBPlayer1': teamBPlayer1,
    'teamBPlayer2': teamBPlayer2,
    'teamAScore': teamAScore,
    'teamBScore': teamBScore,
    'gameType': gameType,
    'status': status,
    'duration': duration,
    'winningTeam': winningTeam,
  };

  // Helper method to create a game summary
  String getGameSummary() {
    final teams = isDoubles
        ? '$teamAPlayer1/$teamAPlayer2 vs $teamBPlayer1/$teamBPlayer2'
        : '$teamAPlayer1 vs $teamBPlayer1';
    return '$teams: $score';
  }

  // Helper method to get opponent names (from perspective of teamA)
  String getOpponents() {
    if (isDoubles) {
      return '$teamBPlayer1/$teamBPlayer2';
    }
    return teamBPlayer1;
  }

  // Create a copy of the game with updated properties
  Game copyWith({
    String? id,
    DateTime? date,
    String? teamAPlayer1,
    String? teamAPlayer2,
    String? teamBPlayer1,
    String? teamBPlayer2,
    int? teamAScore,
    int? teamBScore,
    String? gameType,
    String? status,
    int? duration,
    String? winningTeam,
  }) {
    return Game(
      id: id ?? this.id,
      date: date ?? this.date,
      teamAPlayer1: teamAPlayer1 ?? this.teamAPlayer1,
      teamAPlayer2: teamAPlayer2 ?? this.teamAPlayer2,
      teamBPlayer1: teamBPlayer1 ?? this.teamBPlayer1,
      teamBPlayer2: teamBPlayer2 ?? this.teamBPlayer2,
      teamAScore: teamAScore ?? this.teamAScore,
      teamBScore: teamBScore ?? this.teamBScore,
      gameType: gameType ?? this.gameType,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      winningTeam: winningTeam ?? this.winningTeam,
    );
  }

  // Example usage for creating dummy data
  static List<Game> getDummyGames() {
    return [
      Game(
        id: '1',
        date: DateTime.now().subtract(Duration(hours: 2)),
        teamAPlayer1: 'John',
        teamBPlayer1: 'Mike',
        teamAScore: 21,
        teamBScore: 19,
        gameType: 'singles',
        status: 'completed',
        duration: 45,
        winningTeam: 'A',
      ),
      Game(
        id: '2',
        date: DateTime.now().subtract(Duration(days: 1)),
        teamAPlayer1: 'Sarah',
        teamAPlayer2: 'Tom',
        teamBPlayer1: 'Lisa',
        teamBPlayer2: 'Mark',
        teamAScore: 15,
        teamBScore: 21,
        gameType: 'doubles',
        status: 'completed',
        duration: 60,
        winningTeam: 'B',
      ),
      Game(
        id: '3',
        date: DateTime.now(),
        teamAPlayer1: 'Alex',
        teamBPlayer1: 'David',
        teamAScore: 11,
        teamBScore: 8,
        gameType: 'singles',
        status: 'ongoing',
        duration: 20,
      ),
    ];
  }

  // Validation methods
  bool isValidScore() {
    if (status != 'completed') return true;
    return (teamAScore >= 21 || teamBScore >= 21) &&
        (teamAScore - teamBScore).abs() >= 2;
  }

  bool isValidTeam() {
    if (gameType == 'singles') {
      return teamAPlayer2 == null && teamBPlayer2 == null;
    } else {
      return teamAPlayer2 != null && teamBPlayer2 != null;
    }
  }
}