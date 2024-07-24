// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_order_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupOrderCartModelAdapter extends TypeAdapter<GroupOrderCartModel> {
  @override
  final int typeId = 3;

  @override
  GroupOrderCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupOrderCartModel(
      groupOrderCartId: fields[0] as String,
      groupOrderCartName: fields[1] as String,
      items: (fields[2] as List?)?.cast<OrderCartModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupOrderCartModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.groupOrderCartId)
      ..writeByte(1)
      ..write(obj.groupOrderCartName)
      ..writeByte(2)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupOrderCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
