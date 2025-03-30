import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../../../core/error/failure.dart'; // Ensure the correct path to the Failure class
import 'package:dartz/dartz.dart'; // Import the Either type from dartz

class GetAllProducts {
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}