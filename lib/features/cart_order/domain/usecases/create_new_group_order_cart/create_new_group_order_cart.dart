import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/data/cart_order_repositories_impl.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';

class CreateNewGroupOrderCart
    implements UseCase<Result<List<GroupOrderCartModel>>, GroupOrderCartModel> {
  final CartOrderRepositoriesImpl cartOrderRepositoriesImpl;

  CreateNewGroupOrderCart(this.cartOrderRepositoriesImpl);

  @override
  Future<Result<List<GroupOrderCartModel>>> call(
      GroupOrderCartModel params) async {
    return await cartOrderRepositoriesImpl.createNewGroupOrderCart(params);
  }
}
