import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
  Future<ProductModel> getProduct(String id);
  Future<void> insertProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<void> deleteProduct(String id) async {
    try {
      await dio.delete('/products/$id');
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    try {
      final response = await dio.get('/products/$id');
      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');
      return (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }

  @override
  Future<void> insertProduct(ProductModel product) async {
    try {
      await dio.post('/products', data: product.toJson());
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    try {
      await dio.put('/products/${product.id}', data: product.toJson());
    } on DioException catch (e) {
      throw ServerException(message: e.message ?? 'Unknown error occurred');
    }
  }
}