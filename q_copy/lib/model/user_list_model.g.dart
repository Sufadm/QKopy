// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LeaderAdapter extends TypeAdapter<Leader> {
  @override
  final int typeId = 0;

  @override
  Leader read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Leader(
      userId: fields[0] as String?,
      name: fields[1] as String?,
      profilePic: fields[2] as String?,
      points: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Leader obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.profilePic)
      ..writeByte(3)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LeaderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
