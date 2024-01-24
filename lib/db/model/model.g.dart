// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class JobworkersAdapter extends TypeAdapter<Jobworkers> {
  @override
  final int typeId = 1;

  @override
  Jobworkers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Jobworkers(
      name: fields[1] as String,
      number: fields[2] as String,
      age: fields[3] as String,
      jobcategories: fields[4] as String,
      index: fields[0] as int?,
      image: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Jobworkers obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.index)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.number)
      ..writeByte(3)
      ..write(obj.age)
      ..writeByte(4)
      ..write(obj.jobcategories)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JobworkersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
