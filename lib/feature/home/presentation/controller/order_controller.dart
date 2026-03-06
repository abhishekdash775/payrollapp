import 'package:get/get.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';

class OrderController extends GetxController {
  OrderLocalRepo orderRepo;
  OrderController({required this.orderRepo});
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    loadOrders();
    super.onInit();
  }

  RxList<Map<String, Object?>> orders = <Map<String, Object?>>[].obs;

  Future<void> loadOrders() async {
    isLoading.value = true;
    final result = await orderRepo.getOrders();
    orders.assignAll(result);
        isLoading.value = false;

  }
}
