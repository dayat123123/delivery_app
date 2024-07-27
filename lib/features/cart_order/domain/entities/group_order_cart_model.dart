import 'package:delivery_app/features/cart_order/domain/entities/order_cart_model.dart';
import 'package:hive/hive.dart';

part 'group_order_cart_model.g.dart';

@HiveType(typeId: 3)
class GroupOrderCartModel {
  @HiveField(0)
  final String groupOrderCartId;

  @HiveField(1)
  final String groupOrderCartName;

  @HiveField(2)
  List<OrderCartModel> items;

  GroupOrderCartModel({
    required this.groupOrderCartId,
    required this.groupOrderCartName,
    this.items = const [],
  });

  GroupOrderCartModel copyWith({
    String? groupOrderCartId,
    String? groupOrderCartName,
    List<OrderCartModel>? items,
  }) {
    return GroupOrderCartModel(
      groupOrderCartId: groupOrderCartId ?? this.groupOrderCartId,
      groupOrderCartName: groupOrderCartName ?? this.groupOrderCartName,
      items: items ?? this.items,
    );
  }

  bool hasChanged(GroupOrderCartModel other) {
    if (groupOrderCartId != other.groupOrderCartId ||
        groupOrderCartName != other.groupOrderCartName ||
        (items.length != other.items.length) ||
        items != other.items) {
      return true;
    }

    for (int i = 0; i < (items.length); i++) {
      if (i >= (other.items.length) || items[i].isChange(other.items[i])) {
        return true;
      }
    }
    return false;
  }
}
