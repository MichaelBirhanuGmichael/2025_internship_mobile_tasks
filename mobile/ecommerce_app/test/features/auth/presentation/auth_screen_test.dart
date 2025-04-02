import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/features/auth/presentation/pages/auth_screen.dart';

void main() {
  testWidgets('Toggles between sign-in/sign-up', (tester) async {
    await tester.pumpWidget(
      ProviderScope(child: MaterialApp(home: AuthScreen())),
    );

    // Initial state shows sign-in
    expect(find.text('SIGN IN'), findsOneWidget);

    // Tap toggle button
    await tester.tap(find.text('SIGN UP'));
    await tester.pump();

    // Now shows sign-up
    expect(find.text('SIGN UP'), findsOneWidget);
  });
}