import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:delivery_app/features/popular_now/data/popular_now_repositories.dart';
import 'package:delivery_app/features/popular_now/domain/usecases/get_popular_now/get_popular_now.dart';
import 'package:delivery_app/features/recommended/data/get_recommended_repositories.dart';
import 'package:delivery_app/features/recommended/domain/usecases/get_recommended/get_recommended.dart';
import 'package:delivery_app/shared/extensions/theme_extensions/theme_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final GetIt inject = GetIt.I;

Future<void> initInjector() async {
  inject.registerSingletonAsync<StorageHelper>(() async {
    final storageHelper = StorageHelper();
    return storageHelper;
  });
  await inject.isReady<StorageHelper>();
  inject.registerSingleton<ThemeCubit>(ThemeCubit());
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
  //inject bloc
  inject.registerLazySingleton<Login>(() => Login(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerLazySingleton<Register>(() => Register(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerLazySingleton<Getloggedinuser>(() => Getloggedinuser(
      authentication: inject.get<FirebaseAuthentication>(),
      userRepository: inject.get<FirebaseUserRepository>()));
  inject.registerSingleton<AuthenticationBloc>(AuthenticationBloc(
      getloggedinuser: inject.get<Getloggedinuser>(),
      checkIsLoggedin: inject.get<CheckIsLoggedin>(),
      storageHelper: inject.get<StorageHelper>(),
      login: inject.get<Login>(),
      register: inject.get<Register>()));

  // getpopular
  inject.registerLazySingleton<PopularNowRepositoriesImpl>(
      () => PopularNowRepositoriesImpl());
  inject.registerLazySingleton<GetPopularNow>(() => GetPopularNow(
      popularNowRepositoriesImpl: inject.get<PopularNowRepositoriesImpl>()));

  // getrecommended
  inject.registerLazySingleton<RecommendedRepositoriesImpl>(
      () => RecommendedRepositoriesImpl());
  inject.registerLazySingleton<GetRecommended>(() => GetRecommended(
      recommendedRepositories: inject.get<RecommendedRepositoriesImpl>()));
}
