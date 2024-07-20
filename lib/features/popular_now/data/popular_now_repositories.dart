import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';

abstract interface class PopularNowRepositories {
  Future<Result<List<PopularNowModel>>> getPolularnow();
}

class PopularNowRepositoriesImpl implements PopularNowRepositories {
  @override
  Future<Result<List<PopularNowModel>>> getPolularnow() async {
    List<PopularNowModel> list = [
      const PopularNowModel(
          idProduct: '1',
          namaProduct: "Nasi Padang",
          hargaProduct: 15000,
          jumTerjual: 87,
          sellerName: "Amat",
          jumSave: 65,
          rating: 5.0,
          imageUrl:
              "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0"),
      const PopularNowModel(
          idProduct: '2',
          namaProduct: "Nasi Ketan",
          hargaProduct: 10000,
          sellerName: "Amat",
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: "https://picsum.photos/200/300"),
      const PopularNowModel(
          idProduct: '3',
          namaProduct: "Sate Padang",
          hargaProduct: 10000,
          jumTerjual: 12,
          sellerName: "Amat",
          jumSave: 100,
          rating: 4.5,
          imageUrl:
              "https://images.unsplash.com/photo-1517423440428-a5a00ad493e8"),
      const PopularNowModel(
          idProduct: '4',
          namaProduct: "Nasi Briyani",
          sellerName: "Amat",
          hargaProduct: 10000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl:
              "https://images.unsplash.com/photo-1547721064-da6cfb341d50"),
      const PopularNowModel(
          idProduct: '5',
          namaProduct: "Es Cendol",
          hargaProduct: 10000,
          jumTerjual: 12,
          sellerName: "Amat",
          jumSave: 100,
          rating: 4.5,
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg")
    ];
    await Future.delayed(const Duration(seconds: 1));
    return Result.success(list);
  }
}
