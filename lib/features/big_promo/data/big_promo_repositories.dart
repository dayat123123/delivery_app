import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';

abstract interface class BigPromoRepositories {
  Future<Result<List<BigPromoModel>>> getBigpromo();
}

class BigPromoRepositoriesImpl implements BigPromoRepositories {
  @override
  Future<Result<List<BigPromoModel>>> getBigpromo() async {
    List<BigPromoModel> datalist = [
      const BigPromoModel(
          idProduct: '1',
          namaProduct: 'Nasi Goreng Petaya',
          hargaProduct: 20000,
          discon: 15,
          terjual: 125,
          imageUrl: FilePaths.alljpg),
      const BigPromoModel(
          idProduct: '2',
          namaProduct: 'Pempek Palembang',
          hargaProduct: 10000,
          discon: 15,
          terjual: 125,
          imageUrl: FilePaths.foodjpg),
      const BigPromoModel(
          idProduct: '3',
          namaProduct: 'Nasi Goreng Kampung',
          hargaProduct: 20000,
          discon: 15,
          terjual: 125,
          imageUrl: FilePaths.alljpg),
      const BigPromoModel(
          idProduct: '4',
          namaProduct: 'Martabak Manis',
          hargaProduct: 35000,
          discon: 15,
          terjual: 125,
          imageUrl: FilePaths.foodjpg),
      const BigPromoModel(
          idProduct: '5',
          namaProduct: 'Thai Tea',
          hargaProduct: 10000,
          discon: 15,
          terjual: 125,
          imageUrl: FilePaths.drinkjpg)
    ];
    await Future.delayed(const Duration(seconds: 3));
    return Result.success(datalist);
  }
}
