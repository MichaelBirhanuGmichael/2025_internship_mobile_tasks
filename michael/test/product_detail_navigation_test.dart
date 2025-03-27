import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:michael/screens/home_screen.dart';

void main() {
  testWidgets('Test product detail navigation', (WidgetTester tester) async {
    // Load Home Page
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Tap the first product
    await tester.tap(find.text('Sample Product 1'));
    await tester.pumpAndSettle();

    // Check if the Product Detail Page opened
    expect(find.text('Product Details'), findsOneWidget);

    // Tap the Back button
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    // Verify if we navigated back to the Home Page
    expect(find.text('Home Page'), findsOneWidget);
  });
}
