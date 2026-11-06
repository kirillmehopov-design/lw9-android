# Multi-Screen Global Cart with Live Badge

**Flutter & Dart — Narxoz University**

This project is a separate Flutter assignment, not a replacement for the previous LW8 Smart Catalog.

## Requirements checklist

- [x] `CartProvider` extends `ChangeNotifier`.
- [x] `ChangeNotifierProvider` wraps `MaterialApp`.
- [x] Catalog screen contains **exactly six** products.
- [x] `Add to Cart` / `Remove` buttons are toggles.
- [x] AppBar cart badge always displays the count of selected products.
- [x] Second screen lists selected products.
- [x] Each cart row has its own Remove icon.
- [x] Total price is calculated from selected products.
- [x] Clear All empties the cart.
- [x] Both screens stay synchronized without passing the cart through Navigator.
- [x] Automated tests for core cart logic and both-screen synchronization.

## Run in Android Studio (Windows)

1. Unzip this folder and open `multi_screen_global_cart` in Android Studio.
2. Open **Terminal** at the folder containing `pubspec.yaml`.
3. If `android/` is not present, generate native project files:

   ```bash
   flutter create --platforms=android .
   ```

4. Install packages and start:

   ```bash
   flutter pub get
   flutter run
   ```

5. Select an Android emulator in the devices dropdown. For automated tests use:

   ```bash
   flutter test
   ```

`provider` version is declared in `pubspec.yaml`; no other packages are required.

## Folder structure

```text
lib/
  main.dart
  models/product.dart
  data/sample_products.dart
  providers/cart_provider.dart
  screens/catalog_screen.dart
  screens/cart_screen.dart
  widgets/product_card.dart
  widgets/cart_badge_button.dart
test/
  cart_provider_test.dart
  widget_test.dart
```

## How to demonstrate screen synchronization

1. Open Catalog: red badge shows 0.
2. Add Laptop: the button becomes Remove and the badge shows 1.
3. Add Smartphone: the badge shows 2.
4. Open the cart: Laptop and Smartphone are listed; total is **570000 ₸**.
5. Remove Laptop inside Cart: total becomes **220000 ₸**.
6. Go Back: Laptop now shows Add to Cart, Smartphone shows Remove, badge shows 1.
7. Go to Cart and press Clear All; after returning to Catalog all six buttons show Add to Cart and the badge shows 0.

**Implementation detail:** this assignment uses one shared `ChangeNotifier`, not individual state variables on each screen. All purchases and prices are dummy local data, not real orders/payments.

**Validation:** source prepared in this environment. Flutter SDK is not installed here, so real `flutter analyze` and `flutter test` should be run on your machine before submission.
