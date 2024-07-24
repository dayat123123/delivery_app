import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/categories_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/detail_toko_model.dart';
import 'package:delivery_app/features/detail_toko/domain/entities/product_toko_model.dart';

abstract class DetailTokoRepositories {
  Future<Result<DetailTokoModel>> getDetailToko({required String sellerId});
}

class DetailTokoRepositoriesImpl implements DetailTokoRepositories {
  @override
  Future<Result<DetailTokoModel>> getDetailToko(
      {required String sellerId}) async {
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(
      DetailTokoModel(
          sellerId: sellerId,
          sellerName: "Toko Berkat",
          rating: 4.5,
          soldProducts: 100,
          imageUrl: "https://images.unsplash.com/photo-1547721064-da6cfb341d50",
          listProduct: [
            const ProductTokoModel(
                idProduct: "6",
                namaProduct: "Baju Koko",
                hargaProduct: 150000,
                jumTerjual: 10,
                rating: 4.5,
                discount: 0,
                imageUrl:
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
            const ProductTokoModel(
                idProduct: "7",
                namaProduct: "Baju Kemeja",
                hargaProduct: 150000,
                jumTerjual: 10,
                rating: 4.5,
                discount: 0,
                imageUrl:
                    "https://images.unsplash.com/photo-1547721064-da6cfb341d50")
          ],
          categories: [
            CategoriesTokoModel(
              categoriId: "1",
              categoriName: "Pakaian",
              totalProduct: 10,
            ),
            CategoriesTokoModel(
                categoriId: "2", categoriName: "Minuman", totalProduct: 140)
          ]),
    );
  }
}
