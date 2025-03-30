part of 'product_bloc.dart';

abstract class ProductEvent {}

class LoadProductsEvent extends ProductEvent {}

class LoadProductEvent extends ProductEvent {
  final String id;

  LoadProductEvent(this.id);
}

class AddProductEvent extends ProductEvent {
  final Product product;

  AddProductEvent(this.product);
}

class UpdateProductEvent extends ProductEvent {
  final Product product;

  UpdateProductEvent(this.product);
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  DeleteProductEvent(this.id);
}