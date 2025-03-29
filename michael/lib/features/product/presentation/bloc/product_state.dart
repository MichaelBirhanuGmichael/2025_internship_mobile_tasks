part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductsLoading extends ProductState {}
class ProductsLoaded extends ProductState {
  final List<Product> products;

  ProductsLoaded(this.products);
}
class ProductsError extends ProductState {
  final String message;

  ProductsError(this.message);
}

class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final Product product;

  ProductLoaded(this.product);
}
class ProductError extends ProductState {
  final String message;

  ProductError(this.message);
}

class ProductOperationInProgress extends ProductState {}
class ProductOperationSuccess extends ProductState {
  final String message;

  ProductOperationSuccess(this.message);
}
class ProductOperationFailure extends ProductState {
  final String message;

  ProductOperationFailure(this.message);
}