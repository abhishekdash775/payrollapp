import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payrollapp/core/model/aurgument_model.dart';
import 'package:payrollapp/feature/home/presentation/controller/order_controller.dart';
import 'package:payrollapp/feature/home/presentation/screen/view_order_page.dart';
import 'package:payrollapp/feature/home/presentation/widget/order_shimmer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,

          appBar: AppBar(title: const Text("Orders"), centerTitle: true),

          body: Obx(() {
            if (controller.isLoading.value) {
              return const OrderShimmer();
            }
            if (controller.orders.isEmpty) {
              return const Center(child: Text("No Orders Yet"));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: controller.orders.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final order = controller.orders[index];
                final status = order["status"]?.toString() ?? "";
                final total = order["totalAmount"] ?? "";
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      ViewOrderPage.routeName,
                      arguments: AurgumentModel(
                        id: order["id"] as int,
                        lockButton: status == "completed",
                      ),
                    )!.then((_) {
                      controller.loadOrders();
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order #${order["id"]}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),

                            const SizedBox(height: 6),

                            Text(
                              "Total: \$${total}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: status == "completed"
                                ? Colors.black
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(
                              color: status == "completed"
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        );
      },
    );
  }
}
