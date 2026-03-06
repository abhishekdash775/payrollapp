import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:payrollapp/feature/auth/presentation/controller/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignupController());
  }
}
