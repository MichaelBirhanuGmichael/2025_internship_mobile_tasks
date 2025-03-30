import 'dart:io';
import 'dart:convert';
import '../models/product.dart';

class ProductManager {
  final List<Product> _products = [];
  static const String _fileName = 'products.json';

  List<Product> get products => _products;

  void addProduct(String name, String description, double price) {
    _products.add(Product(name, description, price));
    _saveToFile();
  }

  void editProduct(int index, String name, String description, double price) {
    if (index >= 0 && index < _products.length) {
      _products[index].name = name;
      _products[index].description = description;
      _products[index].price = price;
      _saveToFile();
    }
  }

  void deleteProduct(int index) {
    if (index >= 0 && index < _products.length) {
      _products.removeAt(index);
      _saveToFile();
    }
  }

  Future<void> _saveToFile() async {
    final file = File(_fileName);
    final jsonList = _products.map((product) => product.toJson()).toList();
    await file.writeAsString(json.encode(jsonList));
  }

  Future<void> loadFromFile() async {
    try {
      final file = File(_fileName);
      if (await file.exists()) {
        final contents = await file.readAsString();
        final jsonList = json.decode(contents) as List<dynamic>;
        _products.clear();
        _products.addAll(jsonList.map((json) => Product.fromJson(json)));
      }
    } catch (e) {
      print('Error loading products: $e');
    }
  }
}