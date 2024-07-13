import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/popular_now/domain/entities/popular_now.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';

abstract interface class PopularNowRepositories {
  Future<Result<List<PopularNowModel>>> getPolularnow();
}

class PopularNowRepositoriesImpl implements PopularNowRepositories {
  @override
  Future<Result<List<PopularNowModel>>> getPolularnow() async {
    List<PopularNowModel> list = [
      PopularNowModel(
          idProduct: '1',
          namaProduct: "Nasi Padang",
          hargaProduct: 15000,
          jumTerjual: 87,
          jumSave: 65,
          rating: 5.0,
          imageUrl: FilePaths.foodjpg),
      PopularNowModel(
          idProduct: '2',
          namaProduct: "Nasi Ketan",
          hargaProduct: 10000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.drinkjpg),
      PopularNowModel(
          idProduct: '3',
          namaProduct: "Sate Padang",
          hargaProduct: 10000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.property),
      PopularNowModel(
          idProduct: '4',
          namaProduct: "Nasi Briyani",
          hargaProduct: 10000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.alljpg),
      PopularNowModel(
          idProduct: '5',
          namaProduct: "Es Cendol",
          hargaProduct: 10000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.foodjpg)
    ];
    await Future.delayed(Duration(seconds: 2));
    return Result.success(list);
  }
}
