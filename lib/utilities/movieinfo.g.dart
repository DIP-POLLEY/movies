// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movieinfo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieInfoAdapter extends TypeAdapter<MovieInfo> {
  @override
  final int typeId = 0;

  @override
  MovieInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieInfo(
      movnam: fields[0] as String,
      dictnam: fields[1] as String,
      movimg: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MovieInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.movnam)
      ..writeByte(1)
      ..write(obj.dictnam)
      ..writeByte(2)
      ..write(obj.movimg);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
