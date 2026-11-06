import 'package:flutter_test/flutter_test.dart';
import 'package:multi_screen_global_cart/data/sample_products.dart';
import 'package:multi_screen_global_cart/providers/cart_provider.dart';

void main() {
  group('CartProvider', () {
    test('starts empty and calculates total', () {
      final cart = CartProvider();
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0);
      cart.addProduct(sampleProducts[0]);
      cart.addProduct(sampleProducts[1]);
      expect(cart.itemCount, 2);
      expect(cart.totalPrice, 570000);
    });

    test('toggle adds/removes without duplicates', () {
      final cart = CartProvider();
      cart.addProduct(sampleProducts[0]);
      cart.addProduct(sampleProducts[0]);
      expect(cart.itemCount, 1);
      cart.toggleProduct(sampleProducts[0]);
      expect(cart.itemCount, 0);
      cart.toggleProduct(sampleProducts[0]);
      expect(cart.itemCount, 1);
    });

    test('remove one and clear all', () {
      final cart = CartProvider();
      cart.addProduct(sampleProducts[0]);
      cart.addProduct(sampleProducts[1]);
      cart.removeProduct(1);
      expect(cart.itemCount, 1);
      expect(cart.totalPrice, 220000);
      cart.clearAll();
      expect(cart.itemCount, 0);
      expect(cart.totalPrice, 0);
    });
  });
}
