class Leader {
  final String? userId;
  final String? name;
  final String? profilePic;
  final int? points;

  Leader({
    required this.userId,
    required this.name,
    required this.profilePic,
    required this.points,
  });

  factory Leader.fromJson(Map<String, dynamic> json) {
    return Leader(
      userId: json['userId'],
      name: json['name'],
      profilePic: json['profilePic'],
      points: json['points'],
    );
  }
}

class LeaderModel {
  final String? region;
  final List<Leader>? leaders;

  LeaderModel({
    required this.region,
    required this.leaders,
  });

  factory LeaderModel.fromJson(Map<String, dynamic> json) {
    List<dynamic>? leadersJson = json['leaders'] as List<dynamic>?;
    List<Leader> leaders = [];
    if (leadersJson != null) {
      leaders =
          leadersJson.map((leaderJson) => Leader.fromJson(leaderJson)).toList();
    }
    return LeaderModel(
      region: json['region'],
      leaders: leaders,
    );
  }
}
