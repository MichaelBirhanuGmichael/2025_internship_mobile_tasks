import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../../../core/error/failure.dart'; // Ensure the correct path to the Failure class
import 'package:dartz/dartz.dart';

class UpdateProduct {
  final ProductRepository repository;

  UpdateProduct(this.repository);

  Future<Either<Failure, void>> call(Product product) async {
    return await repository.updateProduct(product);
  }
}