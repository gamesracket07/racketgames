class Player {
  final int id;
  final String name;
  final String team;
  final String country;
  final int rank;
  final String gender;
  final int individualScore;
  final String email;
  final String phone;
  final String? photoUrl;
  final int gamesPlayed;
  final int gamesWon;
  final double winPercentage;
  late DateTime createdAt;

  Player({
    required this.id,
    required this.name,
    required this.team,
    required this.country,
    required this.rank,
    required this.gender,
    required this.individualScore,
    required this.email,
    required this.phone,
    this.photoUrl,
    this.gamesPlayed = 0,
    this.gamesWon = 0,
    this.winPercentage = 0.0,
    required DateTime createdAt,

  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
      team: json['team'],
      country: json['country'],
      rank: json['rank'],
      gender: json['gender'],
      individualScore: json['individual_score'],
      email: json['email'],
      phone: json['phone'],
      photoUrl: json['photoUrl'],
      gamesPlayed: json['gamesPlayed'],
      gamesWon: json['gamesWon'],
      winPercentage: json['winPercentage'],
      createdAt: DateTime.parse(json['createdAt']),
    );



  }
  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'name': name,
    'phone': phone,
    'photoUrl': photoUrl,
    'team': team,
    'country': country,
    'rank': rank,
    'gender': gender,
    'individualScore': individualScore,

    'createdAt': createdAt.toIso8601String(),
  };

}