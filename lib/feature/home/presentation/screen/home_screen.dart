import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:payrollapp/core/model/aurgument_model.dart';
import 'package:payrollapp/core/widgets/app_loader.dart';
import 'package:payrollapp/core/widgets/search_bar_delegate.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';
import 'package:payrollapp/feature/home/presentation/controller/home_screen_controller.dart';
import 'package:payrollapp/feature/home/presentation/screen/view_product_page.dart';
import 'package:payrollapp/feature/home/presentation/widget/product_shimmer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: GetBuilder<HomeScreenController>(
        builder: (controller) {
          return SafeArea(
            child: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              child: RefreshIndicator(
                onRefresh: () async => controller.onRefresh(),
                child: CustomScrollView(
                  controller: controller.scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Theme.of(context).cardColor,
                      title: Text(
                        "Hello, ${controller.userName ?? ""}",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.values.first,
                            ),
                      ).paddingOnly(left: 5),
                    ),
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SearchBarDelegate(
                        child: Container(
                          height: 74,
                          color: Theme.of(context).cardColor,
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 12,
                          ),
                          child: TextField(
                            controller: controller.searchController,
                            onChanged: (value) => controller.searchProduct(),
                            decoration: InputDecoration(
                              hintText: "Search products",
                              prefixIcon: const Icon(LucideIcons.search300),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 20)),
                    controller.isInitialLoading
                        ? const SliverToBoxAdapter(child: ProductShimmer())
                        : SliverPadding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                childCount: controller.items.length,
                                (context, index) {
                                  ProductModel data = controller.items[index];
                                  return InkWell(
                                    onTap: () {
                                      Get.toNamed(
                                        ViewProductPage.routeName,
                                        arguments: AurgumentModel(id: data.id),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.onPrimary,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                          width: 1.2,
                                        ),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     color: Theme.of(context)
                                        //         .colorScheme
                                        //         .primary
                                        //         .withValues(alpha: 0.1),
                                        //     blurRadius: 12,
                                        //     offset: const Offset(0, 6),
                                        //   ),
                                        // ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      const BorderRadius.vertical(
                                                        top: Radius.circular(
                                                          20,
                                                        ),
                                                      ),
                                                  child: Image.network(
                                                    data.thumbnail ?? '',
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (
                                                          _,
                                                          __,
                                                          ___,
                                                        ) => const Center(
                                                          child: Icon(
                                                            Icons
                                                                .image_not_supported,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                                if ((data.discountPercentage ??
                                                        0) >
                                                    0)
                                                  Positioned(
                                                    top: 10,
                                                    left: 10,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 4,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(
                                                          context,
                                                        ).colorScheme.primary,
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        "-${data.discountPercentage!.toStringAsFixed(0)}%",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall
                                                            ?.copyWith(
                                                              color:
                                                                  Theme.of(
                                                                        context,
                                                                      )
                                                                      .colorScheme
                                                                      .onPrimary,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),

                                          const SizedBox(height: 10),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Text(
                                              data.title ?? "",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                            ),
                                          ),
                                          const SizedBox(height: 6),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "₹${data.price}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: 16,
                                                      color: Theme.of(
                                                        context,
                                                      ).colorScheme.primary,
                                                    ),
                                                    const SizedBox(width: 4),
                                                    Text(
                                                      data.rating
                                                              ?.toStringAsFixed(
                                                                1,
                                                              ) ??
                                                          "0",
                                                      style: Theme.of(
                                                        context,
                                                      ).textTheme.bodySmall,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 16,
                                    crossAxisSpacing: 16,
                                    mainAxisExtent: 280,
                                  ),
                            ),
                          ),
                    if (controller.hasError)
                      SliverToBoxAdapter(
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.wifi_off,
                                size: 60,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(height: 16),

                              Text(
                                controller.errorMessage,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                              const SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: controller.onRefresh,
                                child: const Text("Retry"),
                              ),
                            ],
                          ),
                        ),
                      ),

                    if (controller.isLoading)
                      SliverPadding(padding: EdgeInsets.only(bottom: 20)),
                    if (controller.isLoading)
                      const SliverToBoxAdapter(
                        child: AppLoader(isDarkBackground: false),
                      ),
                    SliverPadding(
                      padding: EdgeInsets.only(
                        bottom: Get.mediaQuery.viewInsets.bottom + 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
