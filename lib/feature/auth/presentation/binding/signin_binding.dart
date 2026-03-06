import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:payrollapp/feature/auth/presentation/controller/signin_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>SigninController());
  }
}
