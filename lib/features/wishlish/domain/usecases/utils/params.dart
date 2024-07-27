import 'package:delivery_app/features/wishlish/domain/entities/cart_model.dart';

class GroupAndProductidParam {
  final String groupCartName;
  final String productId;

  GroupAndProductidParam(
      {required this.groupCartName, required this.productId});
}

class GroupAndCartModelParam {
  final String groupCartName;
  final CartModel data;
  GroupAndCartModelParam({required this.groupCartName, required this.data});
}

class ChangeGrupNameFavoritParam {
  final String oldgroupCartName;
  final String newgroupCartName;

  ChangeGrupNameFavoritParam(
      {required this.oldgroupCartName, required this.newgroupCartName});
}
