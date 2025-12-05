import 'package:flutter/material.dart';

/// Arguments passed from your ProductCard / openProductPage
class ProductDetailArgs {
  final String title;
  final String price;
  final String? originalPrice;
  final String imageUrl;

  /// Only used if they make sense (e.g. for clothing)
  final List<String> colours;
  final List<String> sizes;

  final String description;
  final String extraInfo;

  /// If true, user cannot add to basket
  final bool soldOut;

  /// Optional extra fields for richer product pages
  final List<String> features;
  final String careInstructions;

  const ProductDetailArgs({
    required this.title,
    required this.price,
    this.originalPrice,
    required this.imageUrl,
    this.colours = const [],
    this.sizes = const [],
    this.description = '',
    this.extraInfo = '',
    this.soldOut = false,
    this.features = const [],
    this.careInstructions = '',
  });
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProductDetailArgs;

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
        backgroundColor: const Color(0xFF4d2963),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ---------- IMAGE + MAIN INFO ----------
            LayoutBuilder(
              builder: (context, constraints) {
                final isWide = constraints.maxWidth > 700;

                final imageWidget = Expanded(
                  flex: 3,
                  child: AspectRatio(
                    aspectRatio: 4 / 5,
                    child: args.imageUrl.startsWith('http')
                        ? Image.network(args.imageUrl, fit: BoxFit.cover)
                        : Image.asset(args.imageUrl, fit: BoxFit.cover),
                  ),
                );

                final detailsWidget = Expanded(
                  flex: 4,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: isWide ? 24 : 0, top: isWide ? 0 : 24),
                    child: _MainDetails(args: args),
                  ),
                );

                if (isWide) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      imageWidget,
                      detailsWidget,
                    ],
                  );
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    imageWidget,
                    detailsWidget,
                  ],
                );
              },
            ),

            const SizedBox(height: 32),

            // ---------- DESCRIPTION ----------
            if (args.description.isNotEmpty) ...[
              Text(
                'Product Description',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(args.description),
            ],

            // ---------- FEATURES ----------
            if (args.features.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Features',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: args.features
                    .map(
                      (f) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• '),
                          Expanded(child: Text(f)),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],

            // ---------- CARE INSTRUCTIONS ----------
            if (args.careInstructions.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                'Care Instructions',
                style: theme.textTheme.titleMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(args.careInstructions),
            ],

            // ---------- EXTRA INFO ----------
            if (args.extraInfo.isNotEmpty) ...[
              const SizedBox(height: 16),
              Text(
                args.extraInfo,
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Right‑hand side section with title, price, dropdowns, and add‑to‑basket
class _MainDetails extends StatefulWidget {
  final ProductDetailArgs args;

  const _MainDetails({required this.args});

  @override
  State<_MainDetails> createState() => _MainDetailsState();
}

class _MainDetailsState extends State<_MainDetails> {
  String? selectedSize;
  String? selectedColour;

  @override
  void initState() {
    super.initState();
    if (widget.args.sizes.isNotEmpty) {
      selectedSize = widget.args.sizes.first;
    }
    if (widget.args.colours.isNotEmpty) {
      selectedColour = widget.args.colours.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = widget.args;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          args.title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),

        // Price + SOLD OUT label
        Row(
          children: [
            if (args.originalPrice != null) ...[
              Text(
                args.originalPrice!,
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              args.price,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            if (args.soldOut) ...[
              const SizedBox(width: 12),
              const Text(
                'SOLD OUT',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),

        const SizedBox(height: 16),

        // Size dropdown (if relevant)
        if (args.sizes.isNotEmpty) ...[
          const Text('Size'),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: selectedSize,
            items: args.sizes
                .map(
                  (s) => DropdownMenuItem(
                    value: s,
                    child: Text(s),
                  ),
                )
                .toList(),
            onChanged: args.soldOut
                ? null
                : (value) {
                    setState(() => selectedSize = value);
                  },
          ),
          const SizedBox(height: 16),
        ],

        // Colour dropdown (if relevant)
        if (args.colours.isNotEmpty) ...[
          const Text('Colour'),
          const SizedBox(height: 4),
          DropdownButtonFormField<String>(
            initialValue: selectedColour,
            items: args.colours
                .map(
                  (c) => DropdownMenuItem(
                    value: c,
                    child: Text(c),
                  ),
                )
                .toList(),
            onChanged: args.soldOut
                ? null
                : (value) {
                    setState(() => selectedColour = value);
                  },
          ),
          const SizedBox(height: 24),
        ],

        // Add to basket / Sold out button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: args.soldOut
                ? null
                : () {
                    // TODO: hook into your basket logic
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${args.title} added to basket'),
                      ),
                    );
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4d2963),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            ),
            child: Text(
              args.soldOut ? 'SOLD OUT' : 'ADD TO BASKET',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
