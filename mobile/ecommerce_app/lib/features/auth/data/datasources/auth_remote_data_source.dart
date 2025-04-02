import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/errors/exceptions.dart'; // Ensure this file defines the ServerException class

class AuthRemoteDataSource {
  final Dio client;

  AuthRemoteDataSource({required this.client});

  Future<String> login(String email, String password) async {
    try {
      final response = await client.post('/auth/login', data: {
        'email': email,
        'password': password,
      });
      return response.data['token'];
    } on DioException catch (e) {
      throw ServerException(message: e.response?.data['message'] ?? 'Login failed');
    }
  }

  Future<String> register(String name, String email, String password) async {
    try {
      final response = await client.post('/auth/register', data: {
        'name': name,
        'email': email,
        'password': password,
      });
      return response.data['token'];
    } on DioException catch (e) {
      throw ServerException(message: e.response?.data['message'] ?? 'Registration failed');
    }
  }
}