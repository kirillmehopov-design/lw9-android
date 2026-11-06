import 'package:flutter/material.dart';

// One product in our store.
class Product {
  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.icon,
    required this.color,
  });

  final int id;
  final String name;
  final String category;
  final double price;
  final IconData icon;
  final Color color;
}

String formatPrice(double price) => '${price.toStringAsFixed(0)} ₸';
