import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

// Catalog row. Only this card needs to rebuild when its cart status changes.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    final isAdded = context.select<CartProvider, bool>(
      (cart) => cart.contains(product.id),
    );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: product.color.withAlpha(24),
              child: Icon(product.icon, color: product.color, size: 27),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(product.category, style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 12)),
                  const SizedBox(height: 3),
                  Text(formatPrice(product.price),
                    style: const TextStyle(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            const SizedBox(width: 6),
            // Toggle: pressing again removes the same product.
            isAdded
              ? OutlinedButton(
                  key: ValueKey('toggle-${product.id}'),
                  onPressed: () => context.read<CartProvider>().toggleProduct(product),
                  child: const Text('Remove'),
                )
              : FilledButton.tonal(
                  key: ValueKey('toggle-${product.id}'),
                  onPressed: () => context.read<CartProvider>().toggleProduct(product),
                  child: const Text('Add to Cart'),
                ),
          ],
        ),
      ),
    );
  }
}
