import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/data/cart_order_repositories_impl.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/usecases/utils/group_order_cart_params.dart';

class RemoveItemInGroupOrderCart
    implements
        UseCase<Result<List<GroupOrderCartModel>>, OrderCartAndGroupCartParam> {
  final CartOrderRepositoriesImpl cartOrderRepositoriesImpl;

  RemoveItemInGroupOrderCart(this.cartOrderRepositoriesImpl);

  @override
  Future<Result<List<GroupOrderCartModel>>> call(
      OrderCartAndGroupCartParam params) async {
    return await cartOrderRepositoriesImpl.removeItemsInCartOrderGroup(
        newItem: params.orderCartModel, groupData: params.groupOrderCartModel);
  }
}
