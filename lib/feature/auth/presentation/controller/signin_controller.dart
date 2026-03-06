import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:payrollapp/feature/home/presentation/screen/home_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/main_screen.dart';

class SigninController extends GetxController {
  String name = "bchbc";
  RxBool passwordVisible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    emailController.text = "miko.ohara@yopmail.com";
    passwordController.text = "Nimap@123";
  }

  @override
  void onClose() {
    // TODO: implement onClose

    emailController.dispose();
    passwordController.dispose();
        super.onClose();
  
  }

  Future<void> onSignIn() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        Get.snackbar("Success", "Login successful");
        Get.offAllNamed(MainScreen.routeName);
      } on FirebaseAuthException catch (e) {
        String message = "Login failed";

        if (e.code == 'user-not-found') {
          message = "No user found";
        } else if (e.code == 'wrong-password') {
          message = "Wrong password";
        } else if (e.code == 'invalid-email') {
          message = "Invalid email";
        }

        Get.snackbar("Error", message);
      } finally {
        isLoading.value = false;
      }
    }
  }
}
