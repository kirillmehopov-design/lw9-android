import 'package:flutter/material.dart';
import '../models/product.dart';

// Exactly six products, as required by the assignment.
const List<Product> sampleProducts = [
  Product(id: 1, name: 'Laptop', category: 'Computers',
    price: 350000, icon: Icons.laptop_mac, color: Colors.indigo),
  Product(id: 2, name: 'Smartphone', category: 'Phones',
    price: 220000, icon: Icons.smartphone, color: Colors.blue),
  Product(id: 3, name: 'Headphones', category: 'Audio',
    price: 45000, icon: Icons.headphones, color: Colors.teal),
  Product(id: 4, name: 'Smartwatch', category: 'Wearables',
    price: 89000, icon: Icons.watch, color: Colors.deepOrange),
  Product(id: 5, name: 'Tablet', category: 'Tablets',
    price: 180000, icon: Icons.tablet_mac, color: Colors.purple),
  Product(id: 6, name: 'Gaming Mouse', category: 'Accessories',
    price: 19000, icon: Icons.mouse, color: Colors.green),
];
