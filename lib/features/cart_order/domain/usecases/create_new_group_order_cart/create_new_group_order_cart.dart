import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';

class CreateNewGroupOrderCart
    implements UseCase<Result<List<GroupOrderCartModel>>, GroupOrderCartModel> {
  final CartOrderRepository _repository;
  CreateNewGroupOrderCart(this._repository);

  @override
  Future<Result<List<GroupOrderCartModel>>> call(
      GroupOrderCartModel params) async {
    return await _repository.createNewGroupOrderCart(params);
  }
}
