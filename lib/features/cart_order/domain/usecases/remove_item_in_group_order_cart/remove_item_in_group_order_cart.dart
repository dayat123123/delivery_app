import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/utils/group_order_cart_params.dart';

class RemoveItemInGroupOrderCart
    implements
        UseCase<Result<List<GroupOrderCartModel>>, OrderCartAndGroupCartParam> {
  final CartOrderRepository _repository;
  RemoveItemInGroupOrderCart(this._repository);

  @override
  Future<Result<List<GroupOrderCartModel>>> call(
      OrderCartAndGroupCartParam params) async {
    return await _repository.removeItemsInCartOrderGroup(
        deleteItem: params.orderCartModel,
        groupData: params.groupOrderCartModel);
  }
}
