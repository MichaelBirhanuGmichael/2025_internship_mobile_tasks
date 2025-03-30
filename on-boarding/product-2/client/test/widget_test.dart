// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:product_2/main.dart';



void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets('Add product dialog appears', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the floating action button to open the add product dialog.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that the add product dialog is displayed.
    expect(find.text('Add Product'), findsOneWidget);
    expect(find.text('Name'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Price'), findsOneWidget);
  });

  testWidgets('Add product functionality', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Tap the floating action button to open the add product dialog.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Enter product details.
    await tester.enterText(find.byType(TextField).at(0), 'Test Product');
    await tester.enterText(find.byType(TextField).at(1), 'Test Description');
    await tester.enterText(find.byType(TextField).at(2), '10.0');

    // Tap the 'Add' button.
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Verify that the product is added to the list.
    expect(find.text('Test Product'), findsOneWidget);
    expect(find.text('Test Description - \$10.0'), findsOneWidget);
  });

  testWidgets('Edit product functionality', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Add a product first.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'Test Product');
    await tester.enterText(find.byType(TextField).at(1), 'Test Description');
    await tester.enterText(find.byType(TextField).at(2), '10.0');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Tap the edit icon for the product.
    await tester.tap(find.byIcon(Icons.edit));
    await tester.pumpAndSettle();

    // Edit product details.
    await tester.enterText(find.byType(TextField).at(0), 'Updated Product');
    await tester.enterText(find.byType(TextField).at(1), 'Updated Description');
    await tester.enterText(find.byType(TextField).at(2), '20.0');

    // Tap the 'Save' button.
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    // Verify that the product is updated in the list.
    expect(find.text('Updated Product'), findsOneWidget);
    expect(find.text('Updated Description - \$20.0'), findsOneWidget);
  });

  testWidgets('Delete product functionality', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Add a product first.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).at(0), 'Test Product');
    await tester.enterText(find.byType(TextField).at(1), 'Test Description');
    await tester.enterText(find.byType(TextField).at(2), '10.0');
    await tester.tap(find.text('Add'));
    await tester.pumpAndSettle();

    // Tap the delete icon for the product.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    // Verify that the product is removed from the list.
    expect(find.text('Test Product'), findsNothing);
    expect(find.text('Test Description - \$10.0'), findsNothing);
  });
}


