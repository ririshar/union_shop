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
                  HomeTab(
                    label: 'Shop',
                    onTap: placeholderCallbackForButtons,
                    isActive: activeLabel == 'Shop',
                  ),
                  const SizedBox(width: 8),
                  HomeTab(
                    label: 'The Print Shack',
                    onTap: placeholderCallbackForButtons,
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
                  'image':
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                  'title': 'Essential Range - Over 20% OFF!',
                  'subtitle':
                      'Over 20% off our Essential Range. Come and grab yours while stock lasts!',
                  'button': 'BROWSE COLLECTION',
                },
                {
                  'image':
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  'title': 'New Arrivals',
                  'subtitle': 'Check out our latest branded merch.',
                  'button': 'SHOP NOW',
                },
                {
                  'image':
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                  'title': 'Personalisation Service',
                  'subtitle': 'Add your name or initials to select items.',
                  'button': 'PERSONALISE',
                },
                {
                  'image':
                      'https://shop.upsu.net/cdn/shop/files/PortsmouthCityPostcard2_1024x1024@2x.jpg?v=1752232561',
                  'title': 'In-store Collection',
                  'subtitle': 'Order online and collect from reception.',
                  'button': 'FIND OUT MORE',
                },
              ],
              onButtonTap: (item) {
                // placeholder — navigation or action per slide
              },
            ),

            // Centered title row under the slideshow
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
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

            // Products Section (static)
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    const Text(
                      'PRODUCTS SECTION',
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
                          title: 'Placeholder Product 1',
                          price: '£10.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 2',
                          price: '£15.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 3',
                          price: '£20.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                        ProductCard(
                          title: 'Placeholder Product 4',
                          price: '£25.00',
                          imageUrl:
                              'https://shop.upsu.net/cdn/shop/files/PortsmouthCityMagnet1_1024x1024@2x.jpg?v=1752230282',
                        ),
                      ],
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

// ProductCard unchanged (keeps existing behavior)
class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String imageUrl;

  const ProductCard(
      {super.key,
      required this.title,
      required this.price,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/product');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(title,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  maxLines: 2),
              const SizedBox(height: 4),
              Text(price,
                  style: const TextStyle(fontSize: 13, color: Colors.grey)),
            ],
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
