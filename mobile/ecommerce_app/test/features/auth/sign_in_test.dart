import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MockSharedPreferences extends Mock implements SharedPreferences {}



void main() {
  test('Token persists after successful login', () async {
    // Mock SharedPreferences
    final mockPrefs = MockSharedPreferences();
    when(mockPrefs.setString('auth_token', 'mock_token'))
      .thenAnswer((_) async => true);

    // Test token persistence
    // await authService.login('test@email.com', 'password');
    verify(mockPrefs.setString('auth_token', 'mock_token')).called(1);
  });
}