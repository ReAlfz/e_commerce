// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VariantModelAdapter extends TypeAdapter<VariantModel> {
  @override
  final int typeId = 3;

  @override
  VariantModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VariantModel(
      name: fields[0] as String,
      price: fields[2] as int,
      image: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, VariantModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VariantModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
