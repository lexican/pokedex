// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatAdapter extends TypeAdapter<Stat> {
  @override
  final int typeId = 1;

  @override
  Stat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Stat(
      title: fields[0] as String,
      value: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Stat obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.value);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
