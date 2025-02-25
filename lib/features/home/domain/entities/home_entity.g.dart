// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeEntityAdapter extends TypeAdapter<HomeEntity> {
  @override
  final int typeId = 0;

  @override
  HomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeEntity(
      id: fields[0] as int,
      title: fields[1] as String,
      posterPath: fields[2] as String,
      voteAverage: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, HomeEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.posterPath)
      ..writeByte(3)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
