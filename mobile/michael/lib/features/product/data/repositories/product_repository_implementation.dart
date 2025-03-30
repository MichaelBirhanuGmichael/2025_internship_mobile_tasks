import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/exceptions.dart'; 
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/local_product_data_source.dart';
import '../datasources/remote_product_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.deleteProduct(id);
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await remoteDataSource.getProduct(id);
        return Right(product.toEntity());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final products = await remoteDataSource.getProducts();
        await localDataSource.cacheProducts(products);
        return Right(products.map((model) => model.toEntity()).toList());
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();
        return Right(localProducts.map((model) => model.toEntity()).toList());
      } on CacheException catch (e) {
        return Left(CacheFailure(e.message));
      }
    }
  }

  @override
  Future<Either<Failure, void>> insertProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.insertProduct(ProductModel.fromEntity(product));
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.updateProduct(ProductModel.fromEntity(product));
        return const Right(null);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}