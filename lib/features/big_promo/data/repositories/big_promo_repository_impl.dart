import 'package:delivery_app/core/entities/result.dart';
import 'package:delivery_app/features/big_promo/data/data_sources/big_promo_data_source.dart';
import 'package:delivery_app/features/big_promo/domain/entities/big_promo_model.dart';

class BigPromoDataSourceImpl implements BigPromoDataSource {
  @override
  Future<Result<List<BigPromoModel>>> fetchBigPromos() async {
    await Future.delayed(const Duration(seconds: 2));
    return const Result.success([
      BigPromoModel(
        idProduct: '1',
        namaProduct: 'Nasi Goreng Petaya',
        hargaProduct: 20000,
        sellerName: "Amat",
        discount: 15,
        terjual: 125,
        imageUrl: 'assets/images/all.jpg',
      ),
      BigPromoModel(
        idProduct: '2',
        namaProduct: 'Pempek Palembang',
        hargaProduct: 10000,
        sellerName: "Jamil",
        discount: 15,
        terjual: 125,
        imageUrl: 'assets/images/food.jpg',
      ),
      BigPromoModel(
        idProduct: '3',
        namaProduct: 'Nasi Goreng Kampung',
        hargaProduct: 20000,
        sellerName: "Kamal",
        discount: 15,
        terjual: 125,
        imageUrl: 'assets/images/all.jpg',
      ),
      BigPromoModel(
        idProduct: '4',
        namaProduct: 'Martabak Manis',
        hargaProduct: 35000,
        discount: 15,
        sellerName: "Boy",
        terjual: 125,
        imageUrl: 'assets/images/food.jpg',
      ),
      BigPromoModel(
        idProduct: '5',
        namaProduct: 'Thai Tea',
        hargaProduct: 10000,
        sellerName: "Andi",
        discount: 15,
        terjual: 125,
        imageUrl: 'assets/images/drink.jpg',
      ),
    ]);
  }
}
