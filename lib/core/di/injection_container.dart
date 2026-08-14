import 'package:demapp/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:demapp/features/auth/data/repositories/auth_respository_impl.dart';
import 'package:demapp/features/auth/domain/repositories/auth_repoitory.dart';
import 'package:demapp/features/auth/domain/usecase/login_usecase.dart';
import 'package:demapp/features/auth/presentation/bloc/login_bloc.dart';
import 'package:demapp/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:demapp/features/products/data/datasources/product_remote_datasource.dart';
import 'package:demapp/features/products/data/repositories/product_repository_impl.dart';
import 'package:demapp/features/products/domain/repositories/product_repository.dart';
import 'package:demapp/features/products/domain/usecases/get_products_usecase.dart';
import 'package:demapp/features/products/presentation/bloc/product_bloc.dart';
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

  sl.registerLazySingleton<ProductRemoteDatasource>(
    () => ProductRemoteDatasourceImpl(client: sl()),
  );
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDatasource: sl()),
  );
  sl.registerLazySingleton<GetProductsUsecase>(() => GetProductsUsecase(sl()));
  sl.registerLazySingleton<ProductBloc>(
    () => ProductBloc(getProductsUsecase: sl()),
  );
  sl.registerLazySingleton<CartBloc>(() => CartBloc());
}
