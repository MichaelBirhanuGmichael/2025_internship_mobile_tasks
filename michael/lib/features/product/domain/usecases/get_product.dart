import '../entities/product.dart';
import '../repositories/product_repository.dart';
import '../../../../core/error/failure.dart'; // Ensure the correct path to the Failure class
import 'package:dartz/dartz.dart';

class GetProduct {
  final ProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failure, Product>> call(String id) async {
    return await repository.getProduct(id);
  }
}