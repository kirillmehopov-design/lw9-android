import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_screen_global_cart/main.dart';

void main() {
  testWidgets('Changing cart on second screen syncs the catalog badge', (tester) async {
    await tester.pumpWidget(const GlobalCartApp());
    expect(find.byKey(const ValueKey('cart-badge-count')), findsOneWidget);
    expect(find.text('0'), findsOneWidget);

    // Add the first of six products, badge should become 1.
    await tester.tap(find.byKey(const ValueKey('toggle-1')));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
    expect(find.text('Remove'), findsOneWidget);

    // Go to screen 2 and remove it there.
    await tester.tap(find.byTooltip('Open cart'));
    await tester.pumpAndSettle();
    expect(find.text('My Cart (1)'), findsOneWidget);
    expect(find.text('350000 ₸'), findsNWidgets(2)); // item and total
    await tester.tap(find.byTooltip('Remove Laptop'));
    await tester.pumpAndSettle();
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('0 ₸'), findsOneWidget);

    await tester.tap(find.text('Back to Catalog'));
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    expect(find.byKey(const ValueKey('toggle-1')), findsOneWidget);
    expect(find.text('Add to Cart'), findsNWidgets(6));
  });

  testWidgets('Clear All updates cart immediately', (tester) async {
    await tester.pumpWidget(const GlobalCartApp());
    await tester.tap(find.byKey(const ValueKey('toggle-1')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const ValueKey('toggle-2')));
    await tester.pumpAndSettle();
    await tester.tap(find.byTooltip('Open cart'));
    await tester.pumpAndSettle();
    expect(find.text('My Cart (2)'), findsOneWidget);
    expect(find.text('570000 ₸'), findsOneWidget);
    await tester.tap(find.text('Clear All'));
    await tester.pumpAndSettle();
    expect(find.text('Your cart is empty'), findsOneWidget);
    expect(find.text('0 ₸'), findsOneWidget);
  });
}
