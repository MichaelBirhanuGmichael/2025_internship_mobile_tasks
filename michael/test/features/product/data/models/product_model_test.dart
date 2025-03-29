// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:your_app/features/product/data/models/product_model.dart';

// void main() {
//   const tProductModel = ProductModel(
//     id: '1',
//     name: 'Test Product',
//     description: 'Test Description',
//     price: 99.99,
//     imageUrl: 'test_url',
//     category: 'Test Category',
//     rating: 4.5,
//     availableSizes: [40, 41, 42],
//   );

//   const tProductJson = {
//     'id': '1',
//     'name': 'Test Product',
//     'description': 'Test Description',
//     'price': 99.99,
//     'imageUrl': 'test_url',
//     'category': 'Test Category',
//     'rating': 4.5,
//     'availableSizes': [40, 41, 42],
//   };

//   test('should be a subclass of Product entity', () {
//     expect(tProductModel.toEntity(), isA<Product>());
//   });

//   test('should return a valid model from JSON', () {
//     final result = ProductModel.fromJson(tProductJson);
//     expect(result, tProductModel);
//   });

//   test('should return a JSON map containing proper data', () {
//     final result = tProductModel.toJson();
//     expect(result, tProductJson);
//   });

//   test('should return entity when toEntity is called', () {
//     final entity = tProductModel.toEntity();
//     expect(entity.id, '1');
//     expect(entity.name, 'Test Product');
//   });

//   test('should return model when fromEntity is called', () {
//     final entity = tProductModel.toEntity();
//     final model = ProductModel.fromEntity(entity);
//     expect(model, tProductModel);
//   });

//   test('props should contain all properties', () {
//     expect(tProductModel.props, [
//       '1',
//       'Test Product',
//       'Test Description',
//       99.99,
//       'test_url',
//       'Test Category',
//       4.5,
//       [40, 41, 42],
//     ]);
//   });
// }