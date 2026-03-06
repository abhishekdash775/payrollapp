import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ViewOrderShimmer extends StatelessWidget {
  const ViewOrderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// ORDER ITEMS SKELETON
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 5,
            itemBuilder: (_, __) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 14),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [

                      /// IMAGE
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),

                      const SizedBox(width: 14),

                      /// PRODUCT INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Container(
                              height: 14,
                              width: double.infinity,
                              color: Colors.grey,
                            ),

                            const SizedBox(height: 8),

                            Container(
                              height: 14,
                              width: 80,
                              color: Colors.grey,
                            ),

                            const SizedBox(height: 8),

                            Container(
                              height: 12,
                              width: 100,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// SUBTOTAL
                      Container(
                        height: 16,
                        width: 40,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        /// BOTTOM SUMMARY SKELETON
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            padding: const EdgeInsets.all(18),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 14, width: 100, color: Colors.grey),
                    Container(height: 14, width: 40, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(height: 16, width: 120, color: Colors.grey),
                    Container(height: 18, width: 60, color: Colors.grey),
                  ],
                ),

                const SizedBox(height: 20),

                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}