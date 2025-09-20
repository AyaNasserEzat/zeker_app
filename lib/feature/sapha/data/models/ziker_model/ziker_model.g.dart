// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ziker_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ZikerModelAdapter extends TypeAdapter<ZikerModel> {
  @override
  final int typeId = 0;

  @override
  ZikerModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ZikerModel(
      name: fields[0] as String,
      maxCount: fields[1] as int,
      curCount: fields[2] as int,
      cycles: fields[4] as int,
      totalCount: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ZikerModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.maxCount)
      ..writeByte(2)
      ..write(obj.curCount)
      ..writeByte(3)
      ..write(obj.totalCount)
      ..writeByte(4)
      ..write(obj.cycles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ZikerModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
