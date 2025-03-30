import 'package:hive/hive.dart';
import '../../../../../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<void> cacheProducts(List<ProductModel> products);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final Box<ProductModel> productBox;

  ProductLocalDataSourceImpl({required this.productBox});

  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    try {
      await productBox.clear();
      await productBox.addAll(products);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    try {
      return productBox.values.toList();
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}