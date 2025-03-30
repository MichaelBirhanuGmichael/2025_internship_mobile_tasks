import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends Equatable {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final String imageUrl;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final double rating;
  @HiveField(7)
  final List<int> availableSizes;

  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.rating,
    required this.availableSizes,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imageUrl: json['imageUrl'],
      category: json['category'],
      rating: json['rating'].toDouble(),
      availableSizes: List<int>.from(json['availableSizes']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
      'availableSizes': availableSizes,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      category: category,
      rating: rating,
      availableSizes: availableSizes,
    );
  }

  factory ProductModel.fromEntity(Product product) {
    return ProductModel(
      id: product.id,
      name: product.name,
      description: product.description,
      price: product.price,
      imageUrl: product.imageUrl,
      category: product.category,
      rating: product.rating,
      availableSizes: product.availableSizes,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        rating,
        availableSizes,
      ];
}