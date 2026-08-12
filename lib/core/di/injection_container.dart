import 'package:demapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demapp/features/auth/data/repositories/auth_respository_impl.dart';
import 'package:demapp/features/auth/domain/repositories/auth_repoitory.dart';
import 'package:demapp/features/auth/domain/usecase/login_usecase.dart';
import 'package:demapp/features/auth/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> initDependency() async {
  sl.registerLazySingleton<http.Client>(() => http.Client()); // http
  sl.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasourceImpl(client: sl()),
  ); // data source
  sl.registerLazySingleton<AuthRepoitory>(
    () => AuthRespositoryImpl(remoteDatasource: sl()),
  ); // repo

  sl.registerLazySingleton<LoginUsecase>(
    () => LoginUsecase(repoitory: sl()),
  ); // usecase

  sl.registerLazySingleton<LoginBloc>(
    () => LoginBloc(loginUsecase: sl()),
  ); // Bloc
}
