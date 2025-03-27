import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:michael/screens/add_update_screen.dart'; // Ensure correct import

void main() {
  testWidgets('Test adding a new product', (WidgetTester tester) async {
    // Load Add Product Page
    await tester.pumpWidget(const MaterialApp(home: AddUpdateProductPage()));

    // Enter product name
    await tester.enterText(find.byKey(const Key('productNameField')), 'Test Product');

    // Enter category
    await tester.enterText(find.byKey(const Key('categoryField')), 'Electronics');

    // Enter price
    await tester.enterText(find.byKey(const Key('priceField')), '100');

    // Enter description
    await tester.enterText(find.byKey(const Key('descriptionField')), 'This is a test product');

    // Tap the Add button
    await tester.tap(find.byKey(const Key('addButton')));
    await tester.pump();

    // Verify if the product was added (mock or use state check)
    expect(find.text('Test Product'), findsOneWidget);
  });
}
