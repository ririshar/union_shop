import 'package:flutter/material.dart';
import 'main.dart'; // for TopHeader + AppFooter

class PrintShackAboutPage extends StatelessWidget {
  const PrintShackAboutPage({super.key});

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

            // WHITE CONTENT AREA
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),

                      // PAGE TITLE
                      const Text(
                        'The Union Print Shack',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 32),

                      // 3 IMAGES IN A ROW
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final isNarrow = constraints.maxWidth < 800;
                          return Flex(
                            direction:
                                isNarrow ? Axis.vertical : Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              _PrintImage('assets/images/print_shack_left.jpg'),
                              SizedBox(width: 12, height: 12),
                              _PrintImage(
                                  'assets/images/print_shack_center.jpg'),
                              SizedBox(width: 12, height: 12),
                              _PrintImage(
                                  'assets/images/print_shack_right.jpg'),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 32),

                      // TEXT CONTENT – MATCHING THE SITE COPY
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _HeadingText(
                              'Make It Yours at The Union Print Shack',
                            ),
                            _BodyText(
                              'Want to add a personal touch? We’ve got you covered with heat-pressed '
                              'customisation on all our clothing. Swing by the shop – our team’s always '
                              'happy to help you pick the right gear and answer any questions.',
                            ),
                            SizedBox(height: 18),
                            _HeadingText(
                              'Uni Gear or Your Gear – We’ll Personalise It',
                            ),
                            _BodyText(
                              'Whether you’re repping your university or putting your own spin on a hoodie '
                              'you already own, we’ve got you covered. We can personalise official uni-'
                              'branded clothing and your own items – just bring them in and let’s get creative!',
                            ),
                            SizedBox(height: 18),
                            _HeadingText('Simple Pricing, No Surprises'),
                            _BodyText(
                              'Customising your gear won’t break the bank – just £3 for one line of text or '
                              'a small chest logo, and £5 for two lines or a large back logo. Turnaround time '
                              'is up to three working days, and we’ll let you know as soon as it’s ready to collect.',
                            ),
                            SizedBox(height: 18),
                            _HeadingText('Personalisation Terms & Conditions'),
                            _BodyText(
                              'We will print your clothing exactly as you have provided it to us, whether online '
                              'or in person. We are not responsible for any spelling errors. Please ensure your '
                              'chosen text is clearly displayed in either capitals or lowercase. Refunds are not '
                              'provided for any personalised items.',
                            ),
                            SizedBox(height: 18),
                            _HeadingText('Ready to Make It Yours?'),
                            _BodyText(
                              'Pop in or get in touch today – let’s create something uniquely you with our '
                              'personalisation service at The Union Print Shack!',
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _PrintImage extends StatelessWidget {
  final String assetPath;
  const _PrintImage(this.assetPath);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Image.asset(
          assetPath,
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
    );
  }
}

class _HeadingText extends StatelessWidget {
  final String text;
  const _HeadingText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 13,
        height: 1.4,
        color: Colors.black87,
      ),
    );
  }
}
