import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/categories_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/detail_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/usecases/get_detail_toko/get_detail_toko.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_toko_event.dart';
part 'detail_toko_state.dart';

class DetailTokoBloc extends Bloc<DetailTokoEvent, DetailTokoState> {
  final GetDetailToko getDetailToko;

  DetailTokoBloc({required this.getDetailToko}) : super(DetailTokoInitial()) {
    on<LoadDetailToko>(_onLoadDetailToko);
    on<ReLoadCategories>(_onReloadCategories);
  }

  _onLoadDetailToko(LoadDetailToko event, Emitter<DetailTokoState> emit) async {
    try {
      emit(DetailTokoLoading());
      final result = await getDetailToko.call(event.sellerId);
      if (result is Success) {
        emit(DetailTokoLoaded(detailToko: result.resultValue!));
      } else {
        emit(DetailTokoError(message: result.errorMessage.toString()));
      }
    } catch (e) {
      emit(DetailTokoError(message: e.toString()));
    }
  }

  _onReloadCategories(
      ReLoadCategories event, Emitter<DetailTokoState> emit) async {
    try {
      final prevData = event.previousdetailToko;
      final prevList =
          prevData.categories ?? []; // Ambil kategori lama jika ada
      List<CategoriesTokoModel> newList = []; // List baru untuk menyimpan data

      // Salin kategori lama ke list baru
      newList.addAll(prevList);
      newList.addAll(prevList);

      // Buat DetailTokoModel baru dengan list kategori yang sudah diperbarui
      DetailTokoModel newData = DetailTokoModel(
        sellerId: prevData.sellerId,
        sellerName: prevData.sellerName,
        rating: prevData.rating,
        soldProducts: prevData.soldProducts,
        listProduct: prevData.listProduct,
        categories: newList, // Set list kategori baru
        imageUrl: prevData.imageUrl,
      );

      // Emit state baru dengan data yang diperbarui
      emit(DetailTokoLoaded(detailToko: newData));
    } catch (e) {
      // Emit error jika ada exception
      emit(DetailTokoError(message: e.toString()));
    }
  }
}
