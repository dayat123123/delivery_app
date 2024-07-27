import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/domain/entities/group_order_cart_model.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';

class RemoveGroupOrderCart
    implements UseCase<Result<List<GroupOrderCartModel>>, String> {
  final CartOrderRepository _repository;
  RemoveGroupOrderCart(this._repository);

  @override
  Future<Result<List<GroupOrderCartModel>>> call(String params) async {
    return await _repository.removeGroupOrderCart(params);
  }
}
