import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/core/utils/storage_helper.dart';
import 'package:delivery_app/features/authentication/data/firebase/firebase_authentication.dart';
import 'package:delivery_app/features/authentication/data/firebase/firebase_user_repository.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/usecases/checkisLoggedin/check_is_loggedun.dart';
import 'package:delivery_app/features/authentication/domain/usecases/getLoggedinUser/get_loggedin_user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/features/authentication/domain/usecases/register/register.dart';
import 'package:delivery_app/features/authentication/bloc/auth_bloc.dart';
import 'package:delivery_app/features/big_promo/data/big_promo_repositories.dart';
import 'package:delivery_app/features/big_promo/domain/usecases/get_big_promo.dart';
import 'package:delivery_app/features/cart_order/bloc/cart_order_bloc.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_product/domain/usecases/get_product_detail/get_product_detail.dart';
import 'package:delivery_app/features/detail_toko/data/repositories/detail_toko_repositories_impl.dart';
import 'package:delivery_app/features/detail_toko/domain/usecases/get_detail_toko/get_detail_toko.dart';
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/popular_now/domain/usecases/get_popular_now/get_popular_now.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/features/recommended/domain/usecases/get_recommended/get_recommended.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/shared/features/save_and_remove_wishlist/bloc/favorite_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> initInjector() async {
  inject.registerSingletonAsync<StorageHelper>(() async {
    final storageHelper = StorageHelper();
    return storageHelper;
  });
  inject.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  await inject.isReady<StorageHelper>();
  inject.registerSingleton<ThemeCubit>(ThemeCubit(inject.get<StorageHelper>()));

  //--------------INJECT REPOSITORIES----------------//
  //authentication
  inject.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  inject.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  inject.registerLazySingleton<FirebaseAuthentication>(() =>
      FirebaseAuthentication(
          firebaseAuth: inject.get<FirebaseAuth>(),
          fluterSecureStorage: inject.get<StorageHelper>()));
  inject.registerLazySingleton<FirebaseUserRepository>(() =>
      FirebaseUserRepository(
          firebaseFirestore: inject.get<FirebaseFirestore>()));
  inject.registerLazySingleton<Authentication>(
      () => FirebaseAuthentication(firebaseAuth: inject.get<FirebaseAuth>()));
  inject.registerLazySingleton<UserRepository>(() => FirebaseUserRepository(
      firebaseFirestore: inject.get<FirebaseFirestore>()));
  inject.registerLazySingleton<CheckIsLoggedin>(
      () => CheckIsLoggedin(authentication: inject.get<Authentication>()));
  inject.registerLazySingleton<Login>(() => Login(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerLazySingleton<Register>(() => Register(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerLazySingleton<Getloggedinuser>(() => Getloggedinuser(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  // getpopular
  inject.registerLazySingleton<GetPopularNow>(() =>
      GetPopularNow(popularNowRepositoriesImpl: PopularNowRepositoriesImpl()));
  // getrecommended
  inject.registerLazySingleton<GetRecommended>(() =>
      GetRecommended(recommendedRepositories: RecommendedRepositoriesImpl()));
  // getbigpromo
  inject.registerLazySingleton<GetBigPromo>(
      () => GetBigPromo(bigPromoRepositoriesImpl: BigPromoRepositoriesImpl()));
  // get product detail
  inject.registerLazySingleton<GetProductDetail>(() =>
      GetProductDetail(networkProductRepositories: ProductRepositoriesImpl()));
  //get detail toko
  inject.registerLazySingleton<GetDetailToko>(() =>
      GetDetailToko(detailTokoRepositoriesImpl: DetailTokoRepositoriesImpl()));
  //--------------------INJECT BLOC--------------------//
  inject.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
      getloggedinuser: inject.get<Getloggedinuser>(),
      checkIsLoggedin: inject.get<CheckIsLoggedin>(),
      storageHelper: inject.get<StorageHelper>(),
      login: inject.get<Login>(),
      register: inject.get<Register>()));
  inject.registerSingleton<FavoriteBloc>(
      FavoriteBloc(databaseHelper: inject.get<DatabaseHelper>()));
  inject.registerSingleton<CartOrderBloc>(
      CartOrderBloc(databaseHelper: inject.get<DatabaseHelper>()));
}
