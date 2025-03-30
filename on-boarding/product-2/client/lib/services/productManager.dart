
import '../models/product.dart';

class ProductManager {
  final List<Product> _products = [];

  // Add a new product
  void addProduct(String name, String description, double price) {
    _products.add(Product(name, description, price));
  }

  // View all products
  List<Product> get products => _products;

  // Edit a product by index
  void editProduct(int index, String name, String description, double price) {
    if (index >= 0 && index < _products.length) {
      _products[index].name = name;
      _products[index].description = description;
      _products[index].price = price;
    }
  }

  // Delete a product by index
  void deleteProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
    }
  }
}