import 'package:hive/hive.dart';
part 'local_store_model.g.dart';

@HiveType(typeId: 1)
class DataModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String profilePic;
  @HiveField(3)
  String points;

  DataModel({
    required this.name,
    required this.profilePic,
    required this.points,
    this.id,
  });
}
