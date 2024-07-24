// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderCartModelAdapter extends TypeAdapter<OrderCartModel> {
  @override
  final int typeId = 4;

  @override
  OrderCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderCartModel(
      productId: fields[1] as String,
      productName: fields[2] as String,
      productPrice: fields[4] as double,
      quantity: fields[5] as int,
      productImage: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OrderCartModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.productId)
      ..writeByte(2)
      ..write(obj.productName)
      ..writeByte(3)
      ..write(obj.productImage)
      ..writeByte(4)
      ..write(obj.productPrice)
      ..writeByte(5)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
