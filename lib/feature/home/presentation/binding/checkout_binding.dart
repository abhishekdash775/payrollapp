import 'package:get/get.dart';
import 'package:payrollapp/feature/home/data/local/cart_local_repo.dart';
import 'package:payrollapp/feature/home/data/local/order_local_repo.dart';
import 'package:payrollapp/feature/home/presentation/controller/cart_controller.dart';

class CheckoutBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CartController(cartRepo: CartLocalRepo(),orderRepo: OrderLocalRepo()), fenix: true);
  }
}
