import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';

class GetTotalProductInOrderCartUseCase {
  final CartOrderRepository _repository;

  GetTotalProductInOrderCartUseCase(this._repository);

  Future<Result<int>> call() async {
    return await _repository.getTotalProductInOrderCart();
  }
}
