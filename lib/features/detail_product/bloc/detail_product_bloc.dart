import 'package:delivery_app/features/detail_product/bloc/detail_product_event.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final GetProductDetail getProductDetail;
  DetailProductBloc(this.getProductDetail) : super(DetailProductInitial());

  Stream<DetailProductState> mapEventToState(DetailProductEvent event) async* {
    if (event is FetchDetailProducts) {
      yield DetailProductLoading();
      // try {
      //   final result = await getProductDetail.call()
      //   yield ProductLoaded(products: products);
      // } catch (e) {
      //   yield ProductError(error: 'Failed to fetch products');
      // }
    }
  }
}
