import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_product/bloc/detail_product_event.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_product_state.dart';

class DetailProductBloc extends Bloc<DetailProductEvent, DetailProductState> {
  final GetProductDetail getProductDetail;
  DetailProductBloc({required this.getProductDetail})
      : super(DetailProductLoading()) {
    on<LoadDetailProduct>(_onLoadDetailProduct);
    on<RefreshDetailProduct>(_onRefreshDetailProduct);
  }

  void _onLoadDetailProduct(
      LoadDetailProduct event, Emitter<DetailProductState> emit) async {
    try {
      emit(DetailProductLoading());
      final result = await getProductDetail.call(event.idProduct);
      if (result is Success) {
        emit(DetailProductLoaded(detailproduct: result.resultValue!));
      } else {
        emit(DetailProductError(error: result.errorMessage!));
      }
    } catch (e) {
      emit(DetailProductError(error: "Error : $e"));
    }
  }

  void _onRefreshDetailProduct(
      RefreshDetailProduct event, Emitter<DetailProductState> emit) async {
    try {
      emit(DetailProductLoading());
      final result = await getProductDetail.call(event.idProduct);
      if (result is Success) {
        emit(DetailProductLoaded(detailproduct: result.resultValue!));
        event.controller.refreshCompleted();
      } else {
        emit(DetailProductError(error: result.errorMessage!));
        event.controller.refreshFailed();
      }
    } catch (e) {
      emit(DetailProductError(error: "Error : $e"));
      event.controller.refreshFailed();
    }
  }
}
