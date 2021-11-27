// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollectionsAdapter extends TypeAdapter<Collections> {
  @override
  final int typeId = 1;

  @override
  Collections read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Collections(
      id: fields[0] as String,
      idGame: fields[1] as String,
      wish: fields[2] as bool?,
      played: fields[3] as bool?,
      have: fields[4] as bool?,
      rate: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Collections obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.idGame)
      ..writeByte(2)
      ..write(obj.wish)
      ..writeByte(3)
      ..write(obj.played)
      ..writeByte(4)
      ..write(obj.have)
      ..writeByte(5)
      ..write(obj.rate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollectionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
