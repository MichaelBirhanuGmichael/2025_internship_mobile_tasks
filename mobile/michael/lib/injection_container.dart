// lib/injection.dart
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

// Features
import 'features/product/data/datasources/local_product_data_source.dart';
import 'features/product/data/datasources/remote_product_data_source.dart';
import 'features/product/data/models/product_model.dart';
import 'features/product/data/repositories/product_repository_implementation.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecases/delete_product.dart';
import 'features/product/domain/usecases/get_product.dart';
import 'features/product/domain/usecases/get_all_products.dart';
import 'features/product/domain/usecases/insert_product.dart';
import 'features/product/domain/usecases/update_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

// Core
import 'core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Product
  // Bloc
  sl.registerFactory(() => ProductBloc(
    getProducts: sl(),
    deleteProduct: sl(),
    getProduct: sl(),
    updateProduct: sl(),
    insertProduct: sl(),
  ));

  // Use cases
  sl.registerLazySingleton(() => GetAllProducts(sl()));
  sl.registerLazySingleton(() => GetProduct(sl()));
  sl.registerLazySingleton(() => InsertProduct(sl()));
  sl.registerLazySingleton(() => UpdateProduct(sl()));
  sl.registerLazySingleton(() => DeleteProduct(sl()));

  // Repository
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
    remoteDataSource: sl(),
    localDataSource: sl(),
    networkInfo: sl(),
  ));

  // Data sources
  sl.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(dio: sl()),
  );

  sl.registerLazySingleton<ProductLocalDataSource>(
    () => ProductLocalDataSourceImpl(productBox: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final dio = Dio();
  sl.registerLazySingleton(() => dio);

  sl.registerLazySingleton(() => InternetConnectionChecker.createInstance());

  // Initialize Hive
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ProductModelAdapter());
  final productBox = await Hive.openBox<ProductModel>('products');
  sl.registerLazySingleton(() => productBox);
}