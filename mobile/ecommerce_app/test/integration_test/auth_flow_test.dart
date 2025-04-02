// import 'package:integration_test/integration_test.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('Full auth flow', (tester) async {
//     // Launch app
//     await tester.pumpWidget(const MyApp());

//     // Verify splash screen
//     expect(find.text('ECOM'), findsOneWidget);
//     await tester.pumpAndSettle();

//     // Test sign-up
//     await tester.tap(find.text('SIGN UP'));
//     await tester.enterText(find.byType(TextField).at(0), 'Test User');
//     await tester.enterText(find.byType(TextField).at(1), 'test@email.com');
//     await tester.enterText(find.byType(TextField).at(2), 'Password123!');
//     await tester.tap(find.text('SIGN UP'));
//     await tester.pumpAndSettle();

//     // Verify home screen appears
//     expect(find.text('My status'), findsOneWidget);
//   });
// }