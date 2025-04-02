import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSource();
});

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/forgot-password'),
                child: const Text('Forgot Password?'),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _login(ref),
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () => _signup(ref),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login(WidgetRef ref) async {
    final token = await ref.read(authRemoteDataSourceProvider).login(
          _emailController.text,
          _passwordController.text,
        );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  Future<void> _signup(WidgetRef ref) async {
    final token = await ref.read(authRemoteDataSourceProvider).signup(
          _emailController.text,
          _passwordController.text,
        );
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

}

class AuthRemoteDataSource {
  Future<String> login(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return 'dummy_login_token';
  }

  Future<String> signup(String email, String password) async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return 'dummy_signup_token';
  }
}
