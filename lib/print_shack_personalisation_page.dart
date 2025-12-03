////dart
// filepath: c:\Users\riris\Desktop\Union shop\union_shop\lib\print_shack_personalisation_page.dart
import 'package:flutter/material.dart';
import 'main.dart'; // TopHeader, AppFooter

class PrintShackPersonalisationPage extends StatelessWidget {
  const PrintShackPersonalisationPage({super.key});

  void _placeholder() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopHeader(
              activeLabel: 'The Print Shack',
              placeholderCallbackForButtons: _placeholder,
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final isNarrow = constraints.maxWidth < 900;
                      return Flex(
                        direction: isNarrow ? Axis.vertical : Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // LEFT: main image + thumbs
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    'assets/images/personalisation_main.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/images/personalisation_thumb1.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          'assets/images/personalisation_thumb2.jpg',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: isNarrow ? 0 : 60, height: 40),
                          // RIGHT: title + form
                          Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Personalisation',
                                  style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '£3.00',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Tax included.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 24),

                                // Per Line dropdown
                                const Text(
                                  'Per Line:  One Line of Text',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                SizedBox(
                                  width: 260,
                                  child: DropdownButtonFormField<String>(
                                    initialValue: 'One Line of Text',
                                    items: const [
                                      DropdownMenuItem(
                                        value: 'One Line of Text',
                                        child: Text('One Line of Text'),
                                      ),
                                      DropdownMenuItem(
                                        value: 'Two Lines of Text',
                                        child: Text('Two Lines of Text'),
                                      ),
                                    ],
                                    onChanged: (_) {},
                                    decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),

                                const Text(
                                  'Personalisation Line 1:',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                const SizedBox(
                                  width: 360,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 22),

                                const Text(
                                  'Quantity',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6),
                                const SizedBox(
                                  width: 80,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      hintText: '1',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 22),

                                SizedBox(
                                  width: 360,
                                  height: 42,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF4d2963),
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      'ADD TO CART',
                                      style: TextStyle(
                                        letterSpacing: 1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),

                                const Text(
                                  '£3 for one line of text! £5 for two!',
                                  style: TextStyle(fontSize: 13),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'One line of text is 10 characters.',
                                  style: TextStyle(fontSize: 13),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Please ensure all spellings are correct before submitting your purchase '
                                  'as we will print your item with the exact wording you provide. We will '
                                  'not be responsible for any incorrect spellings printed onto your garment. '
                                  'Personalised items do not qualify for refunds.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    height: 1.4,
                                    color: Colors.black87,
                                  ),
                                ),

                                const SizedBox(height: 24),

                                // Fake share buttons row
                                const Row(
                                  children: [
                                    _ShareButton(label: 'SHARE'),
                                    SizedBox(width: 8),
                                    _ShareButton(label: 'TWEET'),
                                    SizedBox(width: 8),
                                    _ShareButton(label: 'PIN IT'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            const AppFooter(),
          ],
        ),
      ),
    );
  }
}

class _ShareButton extends StatelessWidget {
  final String label;
  const _ShareButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        side: const BorderSide(color: Colors.grey),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 11, color: Colors.black87),
      ),
    );
  }
}
