import 'dart:async';
import 'package:flutter/material.dart';
import 'package:union_shop/product_page.dart';

void main() {
  runApp(const UnionShopApp());
}

class UnionShopApp extends StatelessWidget {
  const UnionShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF4d2963)),
      ),
      home: const HomeScreen(),
      routes: {
        '/product': (context) => const ProductPage(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}

// TopHeader: shared header used by HomeScreen and AboutScreen so tabs stay in the same place
class TopHeader extends StatelessWidget {
  final String activeLabel;
  final VoidCallback placeholderCallbackForButtons;

  const TopHeader({
    super.key,
    required this.activeLabel,
    required this.placeholderCallbackForButtons,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Column(
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: const Text(
              'BIG SALE! OUR ESSENTIAL RANGE HAS DROPPED IN PRICE! OVER 20% OFF! COME GRAB YOURS WHILE STOCK LASTS!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          // Main header row (logo, tabs, icons)
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // go home — reset stack to home
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (r) => false);
                    },
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      height: 18,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          width: 18,
                          height: 18,
                          child: const Center(
                            child: Icon(Icons.image_not_supported,
                                color: Colors.grey),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12), // small gap from logo

                  // Tabs (use HomeTab widget)
                  HomeTab(
                    label: 'Home',
                    onTap: () => Navigator.of(context)
                        .pushNamedAndRemoveUntil('/', (r) => false),
                    isActive: activeLabel == 'Home',
                  ),
                  const SizedBox(width: 8),
                  // Shop dropdown (replaces simple Shop HomeTab)
                  ShopDropdown(
                    onSelect: (key) {
                      // handle navigation keys here — update to real routes if available
                      switch (key) {
                        case 'clothing':
                        case 'merchandise':
                        case 'halloween':
                        case 'signature':
                        case 'portsmouth':
                        case 'pride':
                        case 'graduation':
                          // placeholder callback if you don't have routes yet
                          placeholderCallbackForButtons();
                          break;
                        default:
                          placeholderCallbackForButtons();
                      }
                    },
                    isActive: activeLabel == 'Shop',
                  ),
                  const SizedBox(width: 8),
                  PrintShackDropdown(
                    onSelect: (key) {
                      switch (key) {
                        case 'about':
                          Navigator.of(context).pushNamed('/about');
                          break;
                        case 'personalisation':
                          Navigator.of(context).pushNamed('/printshack');
                          break;
                        default:
                          placeholderCallbackForButtons();
                      }
                    },
                    isActive: activeLabel == 'The Print Shack',
                  ),
                  const SizedBox(width: 8),
                  HomeTab(
                    label: 'SALE!',
                    onTap: placeholderCallbackForButtons,
                    isActive: activeLabel == 'SALE!',
                  ),
                  const SizedBox(width: 8),
                  HomeTab(
                    label: 'About',
                    onTap: () => Navigator.of(context).pushNamed('/about'),
                    isActive: activeLabel == 'About',
                  ),
                  const Spacer(),

                  // right side icons
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.person_outline,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.shopping_bag_outlined,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: placeholderCallbackForButtons,
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu,
                              size: 18, color: Colors.grey),
                          padding: const EdgeInsets.all(8),
                          constraints:
                              const BoxConstraints(minWidth: 32, minHeight: 32),
                          onPressed: placeholderCallbackForButtons,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void placeholderCallbackForButtons() {
    // This is the event handler for buttons that don't work yet
  }

  @override
  Widget build(BuildContext context) {
    // Use the shared TopHeader with activeLabel 'Home'
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
                activeLabel: 'Home',
                placeholderCallbackForButtons: placeholderCallbackForButtons),

            // Hero Section (replaced with CarouselHero)
            CarouselHero(
              height: 400,
              items: const [
                {
                  'image': 'assets/images/blueshirt.png',
                  'title': 'Essential Range - Over 20% OFF!',
                  'subtitle':
                      'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
                  'button': 'BROWSE COLLECTION',
                },
                {
                  'image': 'assets/images/yournamehoodie.png',
                  'title': 'The Print Shack',
                  'subtitle':
                      'Lets create something uniquely you with our personalisation service - From£3 for one line of text!.',
                  'button': 'FIND OUT MORE',
                },
                {
                  'image': 'assets/images/pizza.png',
                  'title': 'Hungry?',
                  'subtitle': 'We got this',
                  'button': 'ORDER DOMINOS PIZZA NOW',
                },
                {
                  'image': 'assets/images/flat.png',
                  'title': 'Whats your next move?',
                  'subtitle': 'Are you staying with us?',
                  'button': 'FIND YOUR STUDENT ACCOMODATION',
                },
              ],
              onButtonTap: (item) {
                // placeholder — navigation or action per slide
              },
            ),

            // add extra spacing from carousel
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: const Center(
                child: Text(
                  'ESSENTIAL RANGE - OVER 20% OFF!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            // Featured products: two large products centered and spaced the same as Signature Range
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 420, minWidth: 300),
                      child: const SizedBox(
                        height: 320,
                        child: ProductCard(
                          title: 'Limited Edition Essential Zip Hoodie',
                          originalPrice: '£20.00',
                          price: '£14.00',
                          imageUrl: 'assets/images/pink.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 420, minWidth: 300),
                      child: const SizedBox(
                        height: 320,
                        child: ProductCard(
                          title: 'Essential T-Shirt',
                          originalPrice: '£10.00',
                          price: '£6.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Centered title for Signature Range (below the two featured products)
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              child: const Center(
                child: Text(
                  'SIGNATURE RANGE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            // Signature products: two large products centered and closer together
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 420, minWidth: 300),
                      child: const SizedBox(
                        height: 320,
                        child: ProductCard(
                          title: 'Signature Hoodie',
                          price: '£32.99',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          highlightPrice: true,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 420, minWidth: 300),
                      child: const SizedBox(
                        height: 320,
                        child: ProductCard(
                          title: 'Signature T-Shirt',
                          price: '£14.99',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                          highlightPrice: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Products Section (static)
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PORTSMOUTH CITY COLLECTION',
                      style: TextStyle(
                          fontSize: 20, color: Colors.black, letterSpacing: 1),
                    ),
                    const SizedBox(height: 48),
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount:
                          MediaQuery.of(context).size.width > 600 ? 2 : 1,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 48,
                      children: const [
                        ProductCard(
                          title: 'Portsmouth City Postcard',
                          price: '£1.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Magnet',
                          price: '£4.50',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Bookmark',
                          price: '£3.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Portsmouth City Notebook',
                          price: '£7.50',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Centered "VIEW ALL" button (dark purple, white bold text)
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: navigate to full collection page
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4d2963),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'VIEW ALL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
                      ),
                    ),

                    // gap under the button
                    const SizedBox(height: 40),

                    // Centered title 'OUR RANGE'
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 16),
                      child: const Center(
                        child: Text(
                          'OUR RANGE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),

                    // Quick navigation squares (4) — moved here under OUR RANGE
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 28),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final width = constraints.maxWidth;
                          final crossAxisCount =
                              width > 900 ? 4 : (width > 600 ? 2 : 1);
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 1,
                            children: [
                              NavSquare(
                                imageUrl: 'assets/images/square1.jpg',
                                label: 'Apparel',
                                onTap: () =>
                                    Navigator.of(context).pushNamed('/shop'),
                              ),
                              NavSquare(
                                imageUrl: 'assets/images/square2.jpg',
                                label: 'Collections',
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/collection'),
                              ),
                              NavSquare(
                                imageUrl: 'assets/images/square3.jpg',
                                label: 'Personalisation',
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/printshack'),
                              ),
                              NavSquare(
                                imageUrl: 'assets/images/square4.jpg',
                                label: 'Contact / Info',
                                onTap: () =>
                                    Navigator.of(context).pushNamed('/about'),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Personalisation / Print Shack section (matches provided layout)
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 40),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final isWide = constraints.maxWidth > 800;
                          return Flex(
                            direction: isWide ? Axis.horizontal : Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Left text column
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: isWide ? 40 : 0,
                                      bottom: isWide ? 0 : 24),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Add a Personal Touch',
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      const Text(
                                        'First add your item of clothing to your cart then click below to add your text! One line of text contains 10 characters!',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            height: 1.4),
                                      ),
                                      const SizedBox(height: 24),
                                      ElevatedButton(
                                        onPressed: () {
                                          // TODO: navigate to personalisation page
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xFF4d2963),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 14),
                                        ),
                                        child: const Text(
                                          'CLICK HERE TO ADD TEXT!',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Right image column
                              Flexible(
                                flex: 1,
                                child: Center(
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 360),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                                        fit: BoxFit.cover,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            color: Colors.grey[300],
                                            height: 220,
                                            child: const Center(
                                              child: Icon(
                                                  Icons.image_not_supported,
                                                  color: Colors.grey),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

// AboutScreen: uses same TopHeader so tabs remain in same place and style
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  void placeholderCallbackForButtons() {
    // placeholder
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'About',
              placeholderCallbackForButtons: placeholderCallbackForButtons,
            ),

            // Centered, text-only About section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 32),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'About Us',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Welcome to the Union Shop!\n\nWe’re dedicated to giving you the very best University branded products, with a range of clothing and merchandise available to shop all year round! We even offer an exclusive personalisation service!\n\nAll online purchases are available for delivery or instore collection!\n\nWe hope you enjoy our products as much as we enjoy offering them to you. If you have any questions or comments, please don’t hesitate to contact us at hello@upsu.net.\n\nHappy shopping!\n\nThe Union Shop & Reception Team',
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer (same as Home)
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

// Reusable HomeTab (keeps underline on hover and when active)
class HomeTab extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  const HomeTab(
      {super.key,
      required this.label,
      required this.onTap,
      this.isActive = false});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _hovering = false;

  void _setHover(bool v) {
    if (_hovering == v) return;
    setState(() {
      _hovering = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool underline = _hovering || widget.isActive;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          color: Colors.transparent,
          child: Text(
            widget.label,
            style: TextStyle(
              color: const Color(0xFF4d2963),
              fontWeight: FontWeight.w400,
              fontSize: 13,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: const Color(0xFF4d2963),
              decorationThickness: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}

// ProductCard updated to ensure single price (when no originalPrice) is black
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;
  final String? originalPrice;
  final bool highlightPrice;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    this.originalPrice,
    this.highlightPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Expanded(
            child: imageUrl.startsWith('http')
                ? Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Center(
                          child: Icon(Icons.image_not_supported,
                              color: Colors.grey),
                        ),
                      );
                    },
                  )
                : Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),

          // compact text + price area (reduced vertical gaps)
          Padding(
            padding:
                const EdgeInsets.only(top: 6.0, bottom: 0, left: 0, right: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title
                Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                // make price appear directly under the title (very small gap)
                const SizedBox(height: 4),

                // Show crossed-out original price next to the new price when provided
                if (originalPrice != null)
                  Row(
                    children: [
                      Text(
                        originalPrice!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                else
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 13,
                      color: highlightPrice ? Colors.black : Colors.black,
                      fontWeight:
                          highlightPrice ? FontWeight.w700 : FontWeight.normal,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[50],
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Opening times column
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Opening Hours',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text('❄️ Winter Break Closure Dates ❄️',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 6),
                  Text('Closing 4pm 19/12/2025',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text('Reopening 10am 05/01/2026',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text('Last post date: 12pm on 18/12/2025',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text(
                      '------------------------------------------------------------------',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text('(Term Time)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text('Monday - Friday 10am - 4pm',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text('(Outside of Term Time / Consolidation Weeks)',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  Text('Monday - Friday 10am - 3pm',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  Text('Purchase online 24/7',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            // small gap so columns sit next to each other
            const SizedBox(width: 12),

            // Help & Information column
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 220),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Help and Information',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: 8),
                  Text('Search',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                  SizedBox(height: 6),
                  Text('Terms & Conditions of Sale Policy',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
            ),

            // very small gap so this column sits directly next to Help & Information
            const SizedBox(width: 12),

            // Latest Offers column: title bold + email field and Subscribe button (no gap between field and button)
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 340),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Latest Offers',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  // email field + subscribe button row
                  Row(
                    children: [
                      // email input — expanded to take available width
                      const Expanded(
                        child: SizedBox(
                          height: 40,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your email',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(4),
                                  bottomLeft: Radius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // no gap between field and button — pass zero width SizedBox
                      const SizedBox(width: 0),
                      SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            minimumSize: const Size(120, 40),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(4),
                                bottomRight: Radius.circular(4),
                              ),
                            ),
                          ),
                          child: const Text('Subscribe'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarouselHero extends StatefulWidget {
  final List<Map<String, String>> items;
  final double height;
  final void Function(Map<String, String>)? onButtonTap;

  const CarouselHero({
    super.key,
    required this.items,
    this.height = 400,
    this.onButtonTap,
  });

  @override
  State<CarouselHero> createState() => _CarouselHeroState();
}

class _CarouselHeroState extends State<CarouselHero> {
  late final PageController _controller;
  Timer? _timer;
  int _index = 0;
  bool _playing = true;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    if (!_playing) return;
    _timer = Timer.periodic(const Duration(seconds: 4), (_) {
      final next = (_index + 1) % widget.items.length;
      _controller.animateToPage(next,
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    });
  }

  void _togglePlay() {
    setState(() {
      _playing = !_playing;
      if (_playing) {
        _startTimer();
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.items;
    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Pages
          PageView.builder(
            controller: _controller,
            itemCount: items.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (context, i) {
              final item = items[i];
              return Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    item['image'] ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) =>
                        Container(color: Colors.grey[300]),
                  ),
                  // ignore: deprecated_member_use
                  Container(color: Colors.black.withOpacity(0.55)),
                  // content overlay
                  Positioned(
                    left: 24,
                    right: 24,
                    top: widget.height * 0.18,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['subtitle'] ?? '',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => widget.onButtonTap?.call(item),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4d2963),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                          ),
                          child: Text(item['button'] ?? 'SHOP'),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),

          // Indicators + prev/next
          Positioned(
            bottom: 12,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left, color: Colors.white),
                  onPressed: () {
                    final prev = (_index - 1 + items.length) % items.length;
                    _controller.animateToPage(prev,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                ),
                Row(
                  children: List.generate(items.length, (i) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: i == _index ? 10 : 8,
                      height: i == _index ? 10 : 8,
                      decoration: BoxDecoration(
                        color: i == _index ? Colors.white : Colors.white54,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.white),
                  onPressed: () {
                    final next = (_index + 1) % items.length;
                    _controller.animateToPage(next,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                ),
                const SizedBox(width: 12),
                // Play / Pause
                ElevatedButton(
                  onPressed: _togglePlay,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black45,
                    foregroundColor: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Row(
                    children: [
                      Icon(_playing ? Icons.pause : Icons.play_arrow, size: 16),
                      const SizedBox(width: 6),
                      Text(_playing ? 'Pause' : 'Play'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavSquare extends StatelessWidget {
  final String imageUrl;
  final String label;
  final VoidCallback onTap;

  const NavSquare({
    super.key,
    required this.imageUrl,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ShopDropdown extends StatefulWidget {
  final void Function(String key) onSelect;
  final bool isActive;
  const ShopDropdown(
      {super.key, required this.onSelect, this.isActive = false});

  @override
  State<ShopDropdown> createState() => _ShopDropdownState();
}

class _ShopDropdownState extends State<ShopDropdown> {
  bool _hovering = false;

  void _setHover(bool v) {
    if (_hovering == v) return;
    setState(() {
      _hovering = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool underline = _hovering || widget.isActive;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 6),
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (key) => widget.onSelect(key),
        itemBuilder: (ctx) => <PopupMenuEntry<String>>[
          const PopupMenuItem(value: 'clothing', child: Text('Clothing')),
          const PopupMenuItem(value: 'merchandise', child: Text('Merchandise')),
          const PopupMenuItem(value: 'halloween', child: Text('Halloween 🎃')),
          const PopupMenuItem(
              value: 'signature', child: Text('Signature & Essential Range')),
          const PopupMenuItem(
              value: 'portsmouth', child: Text('Portsmouth City Collection')),
          const PopupMenuItem(
              value: 'pride', child: Text('Pride Collection 🏳️‍🌈')),
          const PopupMenuItem(
              value: 'graduation', child: Text('Graduation 🎓')),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          color: Colors.transparent,
          child: Text(
            'Shop',
            style: TextStyle(
              color: const Color(0xFF4d2963),
              fontWeight: FontWeight.w400,
              fontSize: 13,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: const Color(0xFF4d2963),
              decorationThickness: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}

class PrintShackDropdown extends StatefulWidget {
  final void Function(String key) onSelect;
  final bool isActive;
  const PrintShackDropdown(
      {super.key, required this.onSelect, this.isActive = false});

  @override
  State<PrintShackDropdown> createState() => _PrintShackDropdownState();
}

class _PrintShackDropdownState extends State<PrintShackDropdown> {
  bool _hovering = false;

  void _setHover(bool v) {
    if (_hovering == v) return;
    setState(() {
      _hovering = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool underline = _hovering || widget.isActive;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: PopupMenuButton<String>(
        offset: const Offset(0, 6),
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        onSelected: (key) => widget.onSelect(key),
        itemBuilder: (ctx) => <PopupMenuEntry<String>>[
          const PopupMenuItem(value: 'about', child: Text('About')),
          const PopupMenuItem(
              value: 'personalisation', child: Text('Personalisation')),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          color: Colors.transparent,
          child: Text(
            'The Print Shack',
            style: TextStyle(
              color: const Color(0xFF4d2963),
              fontWeight: FontWeight.w400,
              fontSize: 13,
              decoration:
                  underline ? TextDecoration.underline : TextDecoration.none,
              decorationColor: const Color(0xFF4d2963),
              decorationThickness: 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
