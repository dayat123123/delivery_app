import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';

class GetTotalProductInOrderCartUseCase implements UseCase<Result<int>, void> {
  final CartOrderRepository _repository;

  GetTotalProductInOrderCartUseCase(this._repository);

  @override
  Future<Result<int>> call(void param) async {
    return await _repository.getTotalProductInOrderCart();
  }
}
