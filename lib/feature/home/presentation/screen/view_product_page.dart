import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:payrollapp/core/widgets/app_loader.dart';
import 'package:payrollapp/feature/home/presentation/controller/view_product_controller.dart';
import 'package:payrollapp/feature/home/presentation/widget/view_product_shimmer.dart';

class ViewProductPage extends StatelessWidget {
  static const String routeName = "/view-product";
  const ViewProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewProductController>(
      builder: (controller) {
        final scheme = Theme.of(context).colorScheme;
        final product = controller.product;
        return Scaffold(
          appBar: AppBar(automaticallyImplyLeading: true),
          body: SafeArea(
            child: controller.isLoading
                ? ProductViewShimmer()
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 350,
                          child: PageView.builder(
                            itemCount: product?.images?.length ?? 1,
                            itemBuilder: (context, index) {
                              final image =
                                  product?.images?[index] ?? product?.thumbnail;

                              return Image.network(
                                image ?? "",
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Center(
                                  child: Icon(Icons.image_not_supported),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          color: scheme.surface,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product?.title ?? "",
                                style: Theme.of(context).textTheme.titleLarge
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),

                              const SizedBox(height: 12),

                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 18,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    product?.rating?.toStringAsFixed(1) ?? "0",
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    product?.availabilityStatus ?? "",
                                    style: TextStyle(
                                      color: (product?.stock ?? 0) > 0
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 20),

                              Row(
                                children: [
                                  Text(
                                    "₹${product?.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 12),
                                  if ((product?.discountPercentage ?? 0) > 0)
                                    Text(
                                      "-${product?.discountPercentage!.toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                ],
                              ),

                              const SizedBox(height: 24),

                              Text(
                                "Description",
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product?.description ?? "",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),

                              const SizedBox(height: 24),

                              /// TAGS
                              if (product?.tags != null &&
                                  product!.tags!.isNotEmpty)
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: product.tags!
                                      .map(
                                        (tag) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 6,
                                          ),
                                          decoration: BoxDecoration(
                                            color: scheme.surface,
                                            borderRadius: BorderRadius.circular(
                                              20,
                                            ),
                                          ),
                                          child: Text(
                                            tag,
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodySmall,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),

                              const SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          ),

          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: scheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: controller.addToCart,
                child: controller.isLoading
                    ? AppLoader(isDarkBackground: true)
                    : const Text("Add to Cart"),
              ),
            ),
          ),
        );
      },
    );
  }
}
