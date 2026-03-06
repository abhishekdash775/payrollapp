import 'package:get/get.dart';
import 'package:payrollapp/feature/home/presentation/controller/cart_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/order_controller.dart';
import 'package:payrollapp/feature/home/presentation/controller/profile_controller.dart';
import 'package:payrollapp/feature/home/presentation/screen/cart_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/home_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/order_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/profile_screen.dart';

class MainController extends GetxController {
  int currentIndex = 0;

  final pages = [
    const HomeScreen(), 
    const CartScreen(),
    const OrderScreen(),
    const ProfileScreen(),
  ];

  void changeTab(int index) {
    currentIndex = index;

    if (index == 1) {
      Get.find<CartController>().loadCart(shouldLoad: true);
    }
    if (index == 2) {
      Get.find<OrderController>().loadOrders();
    }
    // if (index == 3) {
    //   Get.find<ProfileController>().loadProfile();
    // }
    update();
  }
}
