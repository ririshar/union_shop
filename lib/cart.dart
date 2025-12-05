//// dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\models\cart.dart
import 'package:flutter/foundation.dart';

class CartItem {
  final String title;
  final String imageUrl;
  final String price; // keep as the display string (e.g. "£14.00")
  final String? size;
  final String? colour;
  final int quantity;

  const CartItem({
    required this.title,
    required this.imageUrl,
    required this.price,
    this.size,
    this.colour,
    this.quantity = 1,
  });

  CartItem copyWith({
    String? title,
    String? imageUrl,
    String? price,
    String? size,
    String? colour,
    int? quantity,
  }) {
    return CartItem(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      price: price ?? this.price,
      size: size ?? this.size,
      colour: colour ?? this.colour,
      quantity: quantity ?? this.quantity,
    );
  }
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get totalItems => _items.fold<int>(0, (sum, item) => sum + item.quantity);

  void addItem(CartItem item) {
    // If same product/size/colour already in cart, increase quantity
    final index = _items.indexWhere((i) =>
        i.title == item.title &&
        i.size == item.size &&
        i.colour == item.colour);

    if (index >= 0) {
      final existing = _items[index];
      _items[index] =
          existing.copyWith(quantity: existing.quantity + item.quantity);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(int index) {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
