import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MockSharedPreferences extends Mock implements SharedPreferences {}
class MockAuthRemoteDataSource extends Mock {
  Future<String> register(String name, String email, String password) async {
    return 'mock_token';
  }
}

void main() {
  late MockAuthRemoteDataSource mockDataSource;
  
  setUp(() {
    mockDataSource = MockAuthRemoteDataSource();
  });

  test('Successful sign-up returns token', () async {
    // Arrange
    when(mockDataSource.register(
      'John Doe', 
      'john@test.com', 
      'Password123',
    )).thenAnswer((_) async => 'mock_token');

    // Act
    final result = await mockDataSource.register(
      'John Doe', 
      'john@test.com', 
      'Password123',
    );

    // Assert
    expect(result, equals('mock_token'));
    verify(mockDataSource.register(
      'John Doe', 
      'john@test.com', 
      'Password123',
    )).called(1);
  });

  test('Sign-up with weak password fails', () async {
    // Test password validation logic
  });
}