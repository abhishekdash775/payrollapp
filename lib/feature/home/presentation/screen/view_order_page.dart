import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payrollapp/core/widgets/app_loader.dart';
import 'package:payrollapp/feature/home/presentation/controller/view_order_controller.dart';
import 'package:payrollapp/feature/home/presentation/widget/view_order_shimer.dart';

class ViewOrderPage extends GetView<ViewOrderController> {
  static String routeName = "/view-order";

  const ViewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Order Details"), centerTitle: true),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: ViewOrderShimmer());
        }

        if (controller.orderItem.isEmpty) {
          return const Center(child: Text("No items found"));
        }

        double total = 0;
        for (var e in controller.orderItem) {
          total += (e.price ?? 0) * (e.quantity ?? 1);
        }

        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.orderItem.length,
                itemBuilder: (context, index) {
                  final item = controller.orderItem[index];
                  final subtotal = (item.price ?? 0) * (item.quantity ?? 1);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: scheme.surface,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        /// PRODUCT IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            item.thumbnail ?? "",
                            height: 70,
                            width: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Icon(Icons.image_not_supported),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title ?? "",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "₹${item.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                "Quantity: ${item.quantity}",
                                style: TextStyle(color: Colors.grey.shade600),
                              ),
                            ],
                          ),
                        ),

                        /// SUBTOTAL
                        Text(
                          "₹${subtotal.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            /// ORDER SUMMARY
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: scheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Items",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(controller.orderItem.length.toString()),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total Amount",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "₹${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.lockButton
                          ? null
                          : () {
                              controller.markRecived();
                              Get.back(result: true);
                              Get.snackbar(
                                "Order Received",
                                "Your order has been marked as received",
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 2),
                              );
                            },
                      child: controller.isMarking.value
                          ? AppLoader(isDarkBackground: true)
                          : controller.lockButton
                          ? Text("Order Completed")
                          : const Text("Mark Order Received"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
