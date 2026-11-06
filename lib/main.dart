import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'screens/catalog_screen.dart';

void main() => runApp(const GlobalCartApp());

class GlobalCartApp extends StatelessWidget {
  const GlobalCartApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider is ABOVE MaterialApp, so both screens
    // use the same CartProvider instance.
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'Global Cart - Flutter Lab',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF315BD8)),
          scaffoldBackgroundColor: const Color(0xFFF7F9FC),
          appBarTheme: const AppBarTheme(centerTitle: false),
        ),
        home: const CatalogScreen(),
      ),
    );
  }
}
