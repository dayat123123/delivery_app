import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery_app/core/utils/local_database/local_database_helper.dart';
import 'package:delivery_app/core/utils/storage_helper/storage_helper.dart';
import 'package:delivery_app/features/authentication/data/firebase/firebase_authentication.dart';
import 'package:delivery_app/features/authentication/data/firebase/firebase_user_repository.dart';
import 'package:delivery_app/features/authentication/data/repositories/authentication.dart';
import 'package:delivery_app/features/authentication/data/repositories/user_repository.dart';
import 'package:delivery_app/features/authentication/domain/usecases/checkisLoggedin/check_is_loggedun.dart';
import 'package:delivery_app/features/authentication/domain/usecases/getLoggedinUser/get_loggedin_user.dart';
import 'package:delivery_app/features/authentication/domain/usecases/login/login.dart';
import 'package:delivery_app/features/authentication/domain/usecases/register/register.dart';
import 'package:delivery_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:delivery_app/features/big_promo/data/data_sources/big_promo_data_source.dart';
import 'package:delivery_app/features/big_promo/data/repositories/big_promo_repository_impl.dart';
import 'package:delivery_app/features/big_promo/domain/repositories/big_promo_repository.dart';
import 'package:delivery_app/features/cart_order/data/data_sources/cart_order_local_data_source.dart';
import 'package:delivery_app/features/cart_order/data/repositories/cart_order_local_repository_impl.dart';
import 'package:delivery_app/features/cart_order/domain/repositories/cart_order_repository.dart';
import 'package:delivery_app/features/cart_order/presentation/bloc/cart_order_bloc.dart';
import 'package:delivery_app/features/detail_product/data/repositories/product_repositories_impl.dart';
import 'package:delivery_app/features/detail_toko/data/repositories/detail_toko_repositories_impl.dart';
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/features/favorit/data/favorite_respositories_impl.dart';
import 'package:delivery_app/features/favorit/presentation/bloc/favorite_bloc.dart';
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
  // favorite
  inject.registerLazySingleton<FavoriteRespositoriesImpl>(() =>
      FavoriteRespositoriesImpl(databaseHelper: inject.get<DatabaseHelper>()));
  // popular now
  inject.registerLazySingleton<PopularNowRepositoriesImpl>(
      () => PopularNowRepositoriesImpl());
  // recommended
  inject.registerLazySingleton<RecommendedRepositoriesImpl>(
      () => RecommendedRepositoriesImpl());
  // big promo
  inject.registerFactory<BigPromoDataSource>(() => BigPromoDataSourceImpl());
  inject.registerFactory<BigPromoRepository>(
      () => BigPromoRepositoryImpl(inject.get<BigPromoDataSource>()));

  // produc detail
  inject.registerLazySingleton<ProductRepositoriesImpl>(
      () => ProductRepositoriesImpl());
  //detail toko
  inject.registerLazySingleton<DetailTokoRepositoriesImpl>(
      () => DetailTokoRepositoriesImpl());
  // cart order
  inject.registerFactory<CartOrderLocalDataSource>(
      () => CartOrderLocalDataSourceImpl(inject.get<DatabaseHelper>()));
  inject.registerFactory<CartOrderRepository>(
      () => CartOrderRepositoryImpl(inject.get<CartOrderLocalDataSource>()));

  //--------------------INJECT BLOC--------------------//
  inject.registerSingleton<AuthenticationBloc>(AuthenticationBloc());
  inject.registerSingleton<FavoriteBloc>(FavoriteBloc());
  inject.registerSingleton<CartOrderBloc>(CartOrderBloc());
}
