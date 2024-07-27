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
import 'package:delivery_app/features/detail_product/data/data_sources/detail_product_network_data_source.dart';
import 'package:delivery_app/features/detail_product/data/repositories/detail_product_network_impl.dart';
import 'package:delivery_app/features/detail_product/domain/repositories/detail_product_repository.dart';
import 'package:delivery_app/features/detail_toko/data/repositories/detail_toko_repositories_impl.dart';
import 'package:delivery_app/features/wishlish/data/data_sources/favorite_local_data_source.dart';
import 'package:delivery_app/features/wishlish/data/repositories/favorite_local_impl.dart';
import 'package:delivery_app/features/wishlish/domain/repositories/favorite_repository.dart';
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:delivery_app/features/wishlish/presentation/bloc/favorite_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//=========registerSingleton==========
///Gunakan ketika Anda ingin satu instance dari dependency untuk seluruh aplikasi dan ingin segera menginisialisasi
/// objek tersebut saat pendaftaran. Cocok untuk objek yang perlu tersedia segera setelah aplikasi dimulai.

//==========registerFactory==========
///Gunakan ketika Anda ingin objek baru setiap kali dependency tersebut diminta.
///Cocok untuk objek yang stateless atau tidak perlu mempertahankan status antar panggilan.

//==========registerLazySingleton==========
///Gunakan ketika Anda ingin satu instance dari dependency untuk seluruh aplikasi, tetapi hanya ingin menginisialisasi objek
///tersebut saat pertama kali diminta.Efisien untuk objek yang berat atau mahal untuk dibuat.

final GetIt inject = GetIt.I;

Future<void> initInjector() async {
  inject.registerSingletonAsync<StorageHelper>(() async => StorageHelper());
  inject.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  await inject.isReady<StorageHelper>();
  //--------------INJECT REPOSITORIES----------------//
  //authentication
  inject.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance);
  inject.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  inject.registerFactory<FirebaseAuthentication>(() => FirebaseAuthentication(
      firebaseAuth: inject.get<FirebaseAuth>(),
      fluterSecureStorage: inject.get<StorageHelper>()));
  inject.registerFactory<FirebaseUserRepository>(() => FirebaseUserRepository(
      firebaseFirestore: inject.get<FirebaseFirestore>()));
  inject.registerFactory<Authentication>(
      () => FirebaseAuthentication(firebaseAuth: inject.get<FirebaseAuth>()));
  inject.registerFactory<UserRepository>(() => FirebaseUserRepository(
      firebaseFirestore: inject.get<FirebaseFirestore>()));
  inject.registerFactory<CheckIsLoggedin>(
      () => CheckIsLoggedin(authentication: inject.get<Authentication>()));
  inject.registerFactory<Login>(() => Login(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerFactory<Register>(() => Register(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerFactory<Getloggedinuser>(() => Getloggedinuser(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  // favorite
  inject.registerFactory<FavoriteLocalDataSource>(
      () => FavoriteLocalImpl(inject.get<DatabaseHelper>()));
  inject.registerFactory<FavoriteRepository>(
      () => FavoriteRepositoryImpl(inject.get<FavoriteLocalDataSource>()));
  // popular now
  inject.registerFactory<PopularNowRepositoriesImpl>(
      () => PopularNowRepositoriesImpl());
  // recommended
  inject.registerFactory<RecommendedRepositoriesImpl>(
      () => RecommendedRepositoriesImpl());
  // big promo
  inject.registerFactory<BigPromoDataSource>(() => BigPromoDataSourceImpl());
  inject.registerFactory<BigPromoRepository>(
      () => BigPromoRepositoryImpl(inject.get<BigPromoDataSource>()));
  // detail product
  inject.registerFactory<DetailProductNetworkDataSource>(
      () => DetailProductNetworkImpl());
  inject.registerFactory<DetailProductRepository>(() =>
      DetailProductRepositoryImpl(
          inject.get<DetailProductNetworkDataSource>()));
  //detail toko
  inject.registerFactory<DetailTokoRepositoriesImpl>(
      () => DetailTokoRepositoriesImpl());
  // cart order
  inject.registerFactory<CartOrderLocalDataSource>(
      () => CartOrderLocalDataSourceImpl(inject.get<DatabaseHelper>()));
  inject.registerFactory<CartOrderRepository>(
      () => CartOrderRepositoryImpl(inject.get<CartOrderLocalDataSource>()));

  //--------------------INJECT BLOC--------------------//
  inject.registerSingleton<ThemeCubit>(ThemeCubit(inject.get<StorageHelper>()));
  inject.registerLazySingleton<AuthenticationBloc>(() => AuthenticationBloc());
  inject.registerLazySingleton<FavoriteBloc>(() => FavoriteBloc());
  inject.registerLazySingleton<CartOrderBloc>(() => CartOrderBloc());
}
