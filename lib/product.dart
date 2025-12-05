
class Product {
  final String title;
  final String price;
  final String imageUrl;
  final String? originalPrice;
  final String category; // e.g. 'hoodie', 'tshirt', 'accessory'
  final String colour;   // single main colour label, e.g. 'Black', 'Pink'
  final String size;     // e.g. 'XS-XL', 'One size'
  final bool soldOut;

  const Product({
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    required this.category,
    required this.colour,
    required this.size,
    this.soldOut = false,
  });
}