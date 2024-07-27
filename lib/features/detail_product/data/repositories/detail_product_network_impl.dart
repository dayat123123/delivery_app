import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/core/utils/location/location_model.dart';
import 'package:delivery_app/features/detail_product/data/data_sources/detail_product_network_data_source.dart';
import 'package:delivery_app/features/detail_product/domain/entities/comment_model.dart';
import 'package:delivery_app/features/detail_product/domain/entities/product_model.dart';

class DetailProductNetworkImpl implements DetailProductNetworkDataSource {
  @override
  Future<Result<DetailProductModel>> fetchDetailProduct(
      String productId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(
      DetailProductModel(
          idProduct: productId,
          categoryProduct: 'All',
          namaProduct: 'Kacang Rebus',
          hargaProduct: 150000,
          jumTerjual: 100,
          jumSave: 85,
          rating: 4.5,
          totalReviewers: 125,
          sellerId: "5",
          sellerName: "Toko Mutiara",
          addressProduct: "Jalan setia budi",
          imageUrl:
              "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
          stockProduct: 150,
          discount: 0,
          numberPhone: "082283236994",
          estimationTime: 91,
          location: const LocationModel(latitude: 19, longitude: 10),
          listComments: [
            const CommentModel(
                isHideAccountId: true,
                listFotoComments: [
                  "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                  "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                  "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                  "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0"
                ],
                imageUrlAccount:
                    "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0",
                commentId: "1",
                commentAccount: "Hidayat18",
                commentDesc: "Produk ini sangat bagus sekali",
                rating: 4.5,
                isHelps: 10),
            const CommentModel(
                isHideAccountId: false,
                commentId: "2",
                commentAccount: "Deasy Amalia",
                commentDesc:
                    "Produk ini sangat bagus sekali digunakan diluar ruangan",
                rating: 4,
                isHelps: 15)
          ]),
    );
  }
}
