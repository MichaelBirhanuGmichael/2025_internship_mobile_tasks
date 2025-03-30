import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getProducts;
  final GetProduct getProduct;
  final InsertProduct insertProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;

  ProductBloc({
    required this.getProducts,
    required this.getProduct,
    required this.insertProduct,
    required this.updateProduct,
    required this.deleteProduct,
  }) : super(ProductInitial()) {
    on<LoadProductsEvent>(_onLoadProducts);
    on<LoadProductEvent>(_onLoadProduct);
    on<AddProductEvent>(_onAddProduct);
    on<UpdateProductEvent>(_onUpdateProduct);
    on<DeleteProductEvent>(_onDeleteProduct);
  }

  Future<void> _onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductsLoading());
    final result = await getProducts();
    result.fold(
      (failure) => emit(ProductsError(failure.message)),
      (products) => emit(ProductsLoaded(products)),
    );
  }

  Future<void> _onLoadProduct(
    LoadProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductLoading());
    final result = await getProduct(event.id);
    result.fold(
      (failure) => emit(ProductError(failure.message)),
      (product) => emit(ProductLoaded(product)),
    );
  }

  Future<void> _onAddProduct(
    AddProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductOperationInProgress());
    final result = await insertProduct(event.product);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.message)),
      (_) => emit(ProductOperationSuccess('Product added successfully')),
    );
  }

  Future<void> _onUpdateProduct(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductOperationInProgress());
    final result = await updateProduct(event.product);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.message)),
      (_) => emit(ProductOperationSuccess('Product updated successfully')),
    );
  }

 Future<void> _onDeleteProduct(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(ProductOperationInProgress());
    final result = await deleteProduct(event.id);
    result.fold(
      (failure) => emit(ProductOperationFailure(failure.message)),
      (_) => emit(ProductOperationSuccess('Product deleted successfully')),
    );
  }
}
 