import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:payrollapp/feature/home/presentation/screen/home_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/main_screen.dart';

class SignupController extends GetxController {
  String name = "bchbc";
  RxBool passwordVisible = false.obs;
  final isLoading = false.obs;
  final _auth = FirebaseAuth.instance;
  RxBool confirmPasswordVisible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    emailController.text = "miko.ohara@yopmail.com";
    passwordController.text = "Nimap@123";
    confirmPasswordController.text = "Nimap@123";
    nameController.text = "Miko Ohara";
    addressController.text = "1-1 Chiyoda, Chiyoda City, Tokyo 100-8111, Japan";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
        super.onClose();

  }

  Future<void> onSignup() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(
              email: emailController.text,
              password: passwordController.text,
            );
        await userCredential.user!.updateDisplayName(
          nameController.text.trim(),
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
              "uid": userCredential.user!.uid,
              "name": nameController.text.trim(),
              "email": emailController.text.trim(),
              "address": addressController.text.trim(),
              "createdAt": FieldValue.serverTimestamp(),
            });
        Get.snackbar("Success", "Account created successfully");

        Get.offAllNamed(MainScreen.routeName);
      } on FirebaseAuthException catch (e) {
        String message = "Signup failed";

        if (e.code == 'email-already-in-use') {
          message = "Email already registered";
        } else if (e.code == 'weak-password') {
          message = "Password too weak";
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
