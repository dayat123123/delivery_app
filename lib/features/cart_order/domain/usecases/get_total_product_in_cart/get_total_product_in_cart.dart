import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/usecases/usecases.dart';
import 'package:delivery_app/features/cart_order/data/cart_order_repositories_impl.dart';

class GetTotalProductInCart implements UseCase<Result<int>, void> {
  final CartOrderRepositoriesImpl cartOrderRepositoriesImpl;

  GetTotalProductInCart(this.cartOrderRepositoriesImpl);

  @override
  Future<Result<int>> call(void params) async {
    return await cartOrderRepositoriesImpl.getTotalProductInOrderCart();
  }
}
