////dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\product_search_data.dart
class ShopProduct {
  final String name;
  final String price;
  final String imagePath;
  final String category; // e.g. 'Clothing', 'Sale', 'Print Shack'

  const ShopProduct({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
  });
}

// Add any products you want searchable here.
const List<ShopProduct> allShopProducts = [
  // Essential range (home page)
  ShopProduct(
    name: 'Limited Edition Essential Zip Hoodie',
    price: '£14.00',
    imagePath: 'assets/images/pink.png',
    category: 'Essential Range',
  ),
  ShopProduct(
    name: 'Essential T-Shirt',
    price: '£6.00',
    imagePath: 'assets/images/pink_tshirt.png',
    category: 'Essential Range',
  ),
  ShopProduct(
    name: 'Signature Hoodie',
    price: '£32.99',
    imagePath: 'assets/images/shoodie.png',
    category: 'Signature Range',
  ),
  ShopProduct(
    name: 'Signature T-Shirt',
    price: '£14.99',
    imagePath: 'assets/images/sshirt.png',
    category: 'Signature Range',
  ),

  // Portsmouth City collection
  ShopProduct(
    name: 'Portsmouth City Postcard',
    price: '£1.00',
    imagePath: 'assets/images/postcard.png',
    category: 'Portsmouth City Collection',
  ),
  ShopProduct(
    name: 'Portsmouth City Magnet',
    price: '£4.50',
    imagePath:
        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
    category: 'Portsmouth City Collection',
  ),
  ShopProduct(
    name: 'Portsmouth City Bookmark',
    price: '£3.00',
    imagePath: 'assets/images/bookmark.png',
    category: 'Portsmouth City Collection',
  ),
  ShopProduct(
    name: 'Portsmouth City Notebook',
    price: '£7.50',
    imagePath: 'assets/images/notebook.png',
    category: 'Portsmouth City Collection',
  ),

  // Graduation (example)
  ShopProduct(
    name: 'Graduation Hoodies',
    price: '£35.00',
    imagePath: 'assets/images/graduation_hoodie.jpg',
    category: 'Graduation',
  ),
  ShopProduct(
    name: 'Graduation bears',
    price: '£15.00',
    imagePath: 'assets/images/graduation_bear.jpg',
    category: 'Graduation',
  ),

  // Sale page – page 1 items
  ShopProduct(
    name: 'A5 Notepad',
    price: '£1.80',
    imagePath: 'assets/images/sale_a5_notepad.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Classic Sweatshirts – Neutral',
    price: '£10.99',
    imagePath: 'assets/images/sale_classic_sweatshirt_neutral.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Recycled Notebook',
    price: '£1.80',
    imagePath: 'assets/images/sale_recycled_notebook.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'iPhone 5/6 Charge & Sync Cable',
    price: '£1.50',
    imagePath: 'assets/images/sale_iphone56_cable.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Type C Charge & Sync Cable',
    price: '£1.50',
    imagePath: 'assets/images/sale_typec_cable.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'USB to USB Charge & Sync Cables',
    price: '£1.50',
    imagePath: 'assets/images/sale_usb_usb_cable.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Dimple Pop Fidget Keyring',
    price: '£0.99',
    imagePath: 'assets/images/sale_dimple_pop_keyring.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Nike Academy 18 Tech Pants (W)',
    price: '£7.00',
    imagePath: 'assets/images/sale_nike_pants_w.jpg',
    category: 'Sale',
  ),
  ShopProduct(
    name: 'Nike Academy 18 Tech Pants (M)',
    price: '£7.00',
    imagePath: 'assets/images/sale_nike_pants_m.jpg',
    category: 'Sale',
  ),
];
