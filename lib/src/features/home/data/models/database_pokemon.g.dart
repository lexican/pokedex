// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_pokemon.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatabasePokemonAdapter extends TypeAdapter<DatabasePokemon> {
  @override
  final int typeId = 0;

  @override
  DatabasePokemon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DatabasePokemon(
      id: fields[0] as int?,
      createdAt: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DatabasePokemon obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatabasePokemonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
