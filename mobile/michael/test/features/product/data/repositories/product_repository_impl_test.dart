import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:michael/core/error/failure.dart';
import 'package:michael/core/error/exceptions.dart';
import 'package:michael/core/network/network_info.dart';
import 'package:michael/features/product/data/datasources/local_product_data_source.dart';
import 'package:michael/features/product/data/datasources/remote_product_data_source.dart';
import 'package:michael/features/product/data/models/product_model.dart';
import 'package:michael/features/product/data/repositories/product_repository_implementation.dart';

class MockRemoteDataSource extends Mock implements ProductRemoteDataSource {}
class MockLocalDataSource extends Mock implements ProductLocalDataSource {}
class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group('getProducts', () {
    const tProductModel = ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      imageUrl: 'test_url',
      category: 'Test Category',
      rating: 4.5,
      availableSizes: [40, 41, 42],
    );
    final tProducts = [tProductModel];
    final tProductsEntity = tProducts.map((e) => e.toEntity()).toList();

    test('should check if device is online', () async {
      // arrange
      when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(() => mockRemoteDataSource.getProducts())
          .thenAnswer((_) async => tProducts);
      // act
      await repository.getAllProducts();
      // assert
      verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when call is successful', () async {
        // arrange
        when(() => mockRemoteDataSource.getProducts())
            .thenAnswer((_) async => tProducts);
        when(() => mockLocalDataSource.cacheProducts(any()))
            .thenAnswer((_) async => {});
        // act
        final result = await repository.getAllProducts();
        // assert
        verify(() => mockRemoteDataSource.getProducts());
        verify(() => mockLocalDataSource.cacheProducts(tProducts));
        expect(result, equals(Right(tProductsEntity)));
      });

      test('should cache data locally when remote call is successful', () async {
        // arrange
        when(() => mockRemoteDataSource.getProducts())
            .thenAnswer((_) async => tProducts);
        when(() => mockLocalDataSource.cacheProducts(any()))
            .thenAnswer((_) async => {});
        // act
        await repository.getAllProducts();
        // assert
        verify(() => mockRemoteDataSource.getProducts());
        verify(() => mockLocalDataSource.cacheProducts(tProducts));
      });

      test('should return server failure when remote call fails', () async {
        // arrange
        when(() => mockRemoteDataSource.getProducts())
            .thenThrow(ServerException(message: 'Server Failure'));
        // act
        final result = await repository.getAllProducts();
        // assert
        verify(() => mockRemoteDataSource.getProducts());
        verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure('Server Failure'))));
      });
    });

    group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('should return cached data when available', () async {
        // arrange
        when(() => mockLocalDataSource.getCachedProducts())
            .thenAnswer((_) async => tProducts);
        // act
        final result = await repository.getAllProducts();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getCachedProducts());
        expect(result, equals(Right(tProductsEntity)));
      });

      test('should return cache failure when no cached data available', () async {
        // arrange
        when(() => mockLocalDataSource.getCachedProducts())
            .thenThrow(CacheException(message: 'No cache found'));
        // act
        final result = await repository.getAllProducts();
        // assert
        verifyZeroInteractions(mockRemoteDataSource);
        verify(() => mockLocalDataSource.getCachedProducts());
        expect(result, equals(Left(CacheFailure('No cache found'))));
      });
    });
  });
}