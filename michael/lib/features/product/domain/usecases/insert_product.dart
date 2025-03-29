import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../../../core/error/failure.dart'; // Ensure the correct path to the Failure class
import 'package:dartz/dartz.dart';

class InsertProduct {
  final ProductRepository repository;

  InsertProduct(this.repository);

  Future<Either<Failure, void>> call(Product product) async {
    return await repository.insertProduct(product);
  }
}