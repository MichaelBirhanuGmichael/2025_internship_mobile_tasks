#!/usr/bin/env dart
import 'dart:io';
import 'package:ecommerce_cli/services/product_manager.dart';

void main() async {
  final productManager = ProductManager();
  await productManager.loadFromFile();

  print('Welcome to the eCommerce CLI App!');

  while (true) {
    print('\nOptions:');
    print('1. View all products');
    print('2. Add a product');
    print('3. Edit a product');
    print('4. Delete a product');
    print('5. Exit');

    stdout.write('Enter your choice (1-5): ');
    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _viewProducts(productManager);
        break;
      case '2':
        await _addProduct(productManager);
        break;
      case '3':
        await _editProduct(productManager);
        break;
      case '4':
        await _deleteProduct(productManager);
        break;
      case '5':
        print('Goodbye!');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void _viewProducts(ProductManager productManager) {
  if (productManager.products.isEmpty) {
    print('No products available.');
    return;
  }

  print('\nAll Products:');
  for (int i = 0; i < productManager.products.length; i++) {
    final product = productManager.products[i];
    print('${i + 1}. ${product.name}');
    print('   Description: ${product.description}');
    print('   Price: \$${product.price}');
    print('-' * 30);
  }
}

Future<void> _addProduct(ProductManager productManager) async {
  print('\nAdd a new product:');
  
  stdout.write('Name: ');
  final name = stdin.readLineSync() ?? '';
  
  stdout.write('Description: ');
  final description = stdin.readLineSync() ?? '';
  
  double? price;
  while (price == null) {
    stdout.write('Price: ');
    final priceInput = stdin.readLineSync();
    price = double.tryParse(priceInput ?? '');
    if (price == null) {
      print('Invalid price. Please enter a valid number.');
    }
  }

  productManager.addProduct(name, description, price);
  print('Product added successfully!');
}

Future<void> _editProduct(ProductManager productManager) async {
  if (productManager.products.isEmpty) {
    print('No products available to edit.');
    return;
  }

  _viewProducts(productManager);
  
  int? index;
  while (index == null || index < 0 || index >= productManager.products.length) {
    stdout.write('\nEnter the product number to edit: ');
    final indexInput = stdin.readLineSync();
    index = (int.tryParse(indexInput ?? '') ?? -1) - 1;
    
    if (index < 0 || index >= productManager.products.length) {
      print('Invalid product number. Please try again.');
    }
  }

  final product = productManager.products[index];
  print('\nEditing Product: ${product.name}');
  
  stdout.write('Name (${product.name}): ');
  final name = stdin.readLineSync() ?? product.name;
  
  stdout.write('Description (${product.description}): ');
  final description = stdin.readLineSync() ?? product.description;
  
  double? price;
  while (price == null) {
    stdout.write('Price (${product.price}): ');
    final priceInput = stdin.readLineSync();
    price = double.tryParse(priceInput ?? '') ?? product.price;
  }

  productManager.editProduct(index, name, description, price);
  print('Product updated successfully!');
}

Future<void> _deleteProduct(ProductManager productManager) async {
  if (productManager.products.isEmpty) {
    print('No products available to delete.');
    return;
  }

  _viewProducts(productManager);
  
  int? index;
  while (index == null || index < 0 || index >= productManager.products.length) {
    stdout.write('\nEnter the product number to delete: ');
    final indexInput = stdin.readLineSync();
    index = (int.tryParse(indexInput ?? '') ?? 0) - 1;
    
    if (index < 0 || index >= productManager.products.length) {
      print('Invalid product number. Please try again.');
    }
  }

  final productName = productManager.products[index].name;
  stdout.write('Are you sure you want to delete "$productName"? (y/n): ');
  final confirmation = stdin.readLineSync()?.toLowerCase();
  
  if (confirmation == 'y') {
    productManager.deleteProduct(index);
    print('Product deleted successfully!');
  } else {
    print('Deletion canceled.');
  }
}