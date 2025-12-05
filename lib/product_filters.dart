
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\widgets\product_filters.dart
import 'package:flutter/material.dart';

class ProductFilters extends StatelessWidget {
  final List<String> categories;
  final List<String> colours;
  final String? selectedCategory;
  final String? selectedColour;
  final ValueChanged<String?> onCategoryChanged;
  final ValueChanged<String?> onColourChanged;

  const ProductFilters({
    super.key,
    required this.categories,
    required this.colours,
    required this.selectedCategory,
    required this.selectedColour,
    required this.onCategoryChanged,
    required this.onColourChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        // Category filter
        DropdownButton<String?>(
          hint: const Text('Filter by type'),
          value: selectedCategory,
          onChanged: onCategoryChanged,
          items: <DropdownMenuItem<String?>>[
            const DropdownMenuItem(
              value: null,
              child: Text('All types'),
            ),
            ...categories.map(
              (c) => DropdownMenuItem(
                value: c,
                child: Text(c),
              ),
            ),
          ],
        ),

        // Colour filter
        DropdownButton<String?>(
          hint: const Text('Filter by colour'),
          value: selectedColour,
          onChanged: onColourChanged,
          items: <DropdownMenuItem<String?>>[
            const DropdownMenuItem(
              value: null,
              child: Text('All colours'),
            ),
            ...colours.map(
              (c) => DropdownMenuItem(
                value: c,
                child: Text(c),
              ),
            ),
          ],
        ),

        // Clear filters button
        TextButton(
          onPressed: () {
            onCategoryChanged(null);
            onColourChanged(null);
          },
          child: const Text('Clear filters'),
        ),
      ],
    );
  }
}
