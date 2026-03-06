import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:payrollapp/core/model/aurgument_model.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';
import 'package:payrollapp/feature/home/data/model/product_model/product_model.dart';

class ViewOrderController extends GetxController {
  final OrderLocalRepo orderRepo;

  ViewOrderController({required this.orderRepo});

  RxInt orderId = 0.obs;
  RxList<ProductModel> orderItem = <ProductModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isMarking = false.obs;
  bool lockButton = false;

  @override
  void onInit() {
    super.onInit();

    final arg = Get.arguments;

    if (arg is AurgumentModel && arg.id != null) {
      orderId.value = arg.id!;
      lockButton = arg.lockButton!;
      fetchOrderItem();
    }
  }

  Future<void> fetchOrderItem() async {
    try {
      isLoading.value = true;

      final result = await orderRepo.getOrderItem(orderId.value);

      orderItem.assignAll(result);

      debugPrint("Order items fetched: ${result.length}");
    } catch (e) {
      debugPrint("Error fetching order items: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> markRecived() async {
    isMarking.value = true;
    await orderRepo.updateOrderStatus(orderId.value);
    isMarking.value = true;
  }
}
