import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:michael/features/product/presentation/screens/home_screen.dart';

void main() {
  testWidgets('Test product listing updates correctly', (WidgetTester tester) async {
    // Load Home Page
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));

    // Check if initial products exist
    expect(find.text('Sample Product 1'), findsOneWidget);
    expect(find.text('Sample Product 2'), findsOneWidget);

    // Simulate adding a new product
    await tester.enterText(find.byKey(const Key('productNameField')), 'New Product');
    await tester.tap(find.byKey(const Key('addButton')));
    await tester.pump();

    // Verify if the new product appears in the list
    expect(find.text('New Product'), findsOneWidget);
  });
}
