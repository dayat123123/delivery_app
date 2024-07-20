import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/recommended/domain/entities/recommended.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';

abstract interface class RecommendedRepositories {
  Future<Result<List<RecommendedModel>>> getRecommended();
}

class RecommendedRepositoriesImpl implements RecommendedRepositories {
  @override
  Future<Result<List<RecommendedModel>>> getRecommended() async {
    List<RecommendedModel> list = [
      const RecommendedModel(
          idProduct: '1',
          namaProduct: "Soto Makassar",
          hargaProduct: 35000,
          jumTerjual: 11,
          jumSave: 65,
          rating: 5.0,
          imageUrl: FilePaths.alljpg),
      const RecommendedModel(
          idProduct: '2',
          namaProduct: "Cincang Ayam",
          hargaProduct: 20000,
          jumTerjual: 45,
          jumSave: 66,
          rating: 3.9,
          imageUrl: FilePaths.foodjpg),
      const RecommendedModel(
          idProduct: '3',
          namaProduct: "Sate Madura",
          hargaProduct: 25000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.alljpg),
      const RecommendedModel(
          idProduct: '4',
          namaProduct: "Sop Buntut",
          hargaProduct: 50000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.foodjpg),
      const RecommendedModel(
          idProduct: '5',
          namaProduct: "Matrabak Mesir",
          hargaProduct: 30000,
          jumTerjual: 12,
          jumSave: 100,
          rating: 4.5,
          imageUrl: FilePaths.foodjpg)
    ];
    await Future.delayed(const Duration(seconds: 2));
    return Result.success(list);
  }
}
