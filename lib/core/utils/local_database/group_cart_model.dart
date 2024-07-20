import 'package:delivery_app/core/utils/local_database/cart_model.dart';
import 'package:hive/hive.dart';

part 'group_cart_model.g.dart';

@HiveType(typeId: 2)
class GroupCartModel {
  @HiveField(0)
  final String groupCartName;

  @HiveField(1)
  List<CartModel>? items;

  GroupCartModel({required this.groupCartName, this.items});
}
