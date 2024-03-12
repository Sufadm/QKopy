import 'package:hive/hive.dart';
part 'user_list_model.g.dart';

@HiveType(typeId: 0)
class Leader extends HiveObject {
  @HiveField(0)
  final String? userId;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? profilePic;

  @HiveField(3)
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
