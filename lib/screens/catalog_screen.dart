import 'package:flutter/material.dart';
import '../data/sample_products.dart';
import '../widgets/cart_badge_button.dart';
import '../widgets/product_card.dart';
import 'cart_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Catalog'),
        actions: [
          CartBadgeButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (_) => const CartScreen()),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Choose your products', style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 22)),
          const SizedBox(height: 4),
          const Text('Tap Add to Cart to select. Tap Remove to undo.'),
          const SizedBox(height: 14),
          ...sampleProducts.map((product) => ProductCard(product: product)),
        ],
      ),
    );
  }
}
