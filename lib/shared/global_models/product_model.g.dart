// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 0;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      productId: fields[0] as int,
      variantColor: (fields[1] as List?)?.cast<VariantModel>(),
      variantSwitch: (fields[2] as List?)?.cast<VariantModel>(),
      title: fields[3] as String,
      description: fields[4] as String,
      category: fields[6] as String,
      stock: fields[7] as int,
      favorite: fields[9] as bool,
      price: fields[8] as int,
      images: (fields[5] as List).cast<String>(),
      goodReview: fields[12] as num,
      numberChat: fields[13] as int,
      rating: fields[10] as num,
      totalReview: fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.variantColor)
      ..writeByte(2)
      ..write(obj.variantSwitch)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.images)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.price)
      ..writeByte(9)
      ..write(obj.favorite)
      ..writeByte(10)
      ..write(obj.rating)
      ..writeByte(11)
      ..write(obj.totalReview)
      ..writeByte(12)
      ..write(obj.goodReview)
      ..writeByte(13)
      ..write(obj.numberChat);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
