import 'package:get/get.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';
import 'package:payrollapp/feature/home/presentation/controller/view_order_controller.dart';

class ViewOrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ViewOrderController(orderRepo: OrderLocalRepo()));
  }
}
