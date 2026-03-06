import 'package:get/get.dart';
import 'package:payrollapp/feature/auth/presentation/binding/signin_binding.dart';
import 'package:payrollapp/feature/auth/presentation/binding/signup_binding.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signin_screen.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signup_screen.dart';
import 'package:payrollapp/feature/auth/presentation/screen/splash_screen.dart';
import 'package:payrollapp/feature/home/presentation/binding/checkout_binding.dart';
import 'package:payrollapp/feature/home/presentation/binding/main_binding.dart';
import 'package:payrollapp/feature/home/presentation/binding/view_order_binding.dart';
import 'package:payrollapp/feature/home/presentation/binding/view_product_binding.dart';
import 'package:payrollapp/feature/home/presentation/controller/cart_controller.dart';
import 'package:payrollapp/feature/home/presentation/screen/checkout_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/home_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/main_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/view_order_page.dart';
import 'package:payrollapp/feature/home/presentation/screen/view_product_page.dart';

class AppRouter {
  static final List<GetPage> routers = [
    GetPage(
      name: SplashScreen.routeName,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: MainScreen.routeName,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: SigninScreen.routeName,
      page: () => SigninScreen(),
      binding: SigninBinding(),
    ),

    GetPage(
      name: SignupScreen.routeName,
      page: () => SignupScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: ViewProductPage.routeName,
      page: () => ViewProductPage(),
      binding: ViewProductBinding(),
    ),
      GetPage(
      name: CheckoutScreen.routeName,
      page: () => CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(name: ViewOrderPage.routeName, page: ()=>ViewOrderPage(),binding: ViewOrderBinding())
  ];
}
