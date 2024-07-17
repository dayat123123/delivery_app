// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupCartModelAdapter extends TypeAdapter<GroupCartModel> {
  @override
  final int typeId = 2;

  @override
  GroupCartModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupCartModel(
      groupCartName: fields[0] as String,
      items: (fields[1] as List?)?.cast<CartModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupCartModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.groupCartName)
      ..writeByte(1)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupCartModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
