import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductViewShimmer extends StatelessWidget {
  const ProductViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    Widget box({
      double height = 16,
      double width = double.infinity,
      double radius = 8,
    }) {
      return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: scheme.surface,
          borderRadius: BorderRadius.circular(radius),
        ),
      );
    }

    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: Scaffold(
        backgroundColor: scheme.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ================= IMAGE SHIMMER =================
                Container(
                  height: 350,
                  width: double.infinity,
                  color: scheme.surface,
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// TITLE
                      box(height: 26, width: 260),
                      const SizedBox(height: 10),
                      box(height: 20, width: 180),

                      const SizedBox(height: 16),

                      /// RATING + STOCK
                      Row(
                        children: [
                          box(height: 18, width: 18, radius: 4),
                          const SizedBox(width: 8),
                          box(height: 16, width: 40),
                          const SizedBox(width: 16),
                          box(height: 16, width: 90),
                        ],
                      ),

                      const SizedBox(height: 24),

                      /// PRICE
                      Row(
                        children: [
                          box(height: 28, width: 120),
                          const SizedBox(width: 12),
                          box(height: 20, width: 60),
                        ],
                      ),

                      const SizedBox(height: 32),

                      /// DESCRIPTION TITLE
                      box(height: 20, width: 140),

                      const SizedBox(height: 12),

                      /// DESCRIPTION LINES
                      box(),
                      const SizedBox(height: 8),
                      box(),
                      const SizedBox(height: 8),
                      box(width: 280),

                      const SizedBox(height: 30),

                      /// TAGS
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(
                          4,
                          (_) => box(height: 32, width: 80, radius: 20),
                        ),
                      ),

                      const SizedBox(height: 120),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        /// ================= BOTTOM BUTTON SHIMMER =================
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: scheme.surface,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: box(height: 50, radius: 12),
        ),
      ),
    );
  }
}
