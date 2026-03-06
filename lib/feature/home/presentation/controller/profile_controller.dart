import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payrollapp/core/model/user_model/user_model.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signin_screen.dart';
import 'package:payrollapp/feature/auth/presentation/screen/splash_screen.dart';

class ProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  RxBool isSaving = false.obs;
  Rxn<UserModel> user = Rxn();
  StreamSubscription<DocumentSnapshot>? _subscription;
  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  @override
  void onClose() {
    // TODO: implement onClose

    _subscription?.cancel();
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.onClose();
  }

  Future<void> loadProfile() async {
      _subscription?.cancel();

    final uid = FirebaseAuth.instance.currentUser!.uid;

    _subscription = FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .listen((doc) {
          final data = doc.data();
          if (data == null) return;
          final userData = UserModel.fromJson(data);
          user.value = userData;
          nameController.text = userData.name ?? "";
          emailController.text = userData.email ?? "";
          addressController.text = userData.address ?? "";
        });
  }

  Future<void> saveProfile() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    isSaving.value = true;

    try {
      final updatedUser = UserModel(
        uid: uid,
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        address: addressController.text.trim(),
      );

      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set(updatedUser.toJson(), SetOptions(merge: true));
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isSaving.value = false;
    }

    Get.snackbar(
      "Profile Updated",
      "Your profile has been updated",
      snackPosition: SnackPosition.TOP,
    );
  }

  void logout() async {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to logout?",
      textConfirm: "Logout",
      textCancel: "Cancel",
      onConfirm: () async {
        await FirebaseAuth.instance.signOut();
        print("USER AFTER LOGOUT: ${FirebaseAuth.instance.currentUser}");
        Get.back();
        await Future.delayed(const Duration(milliseconds: 200));
        Get.offAllNamed(SplashScreen.routeName);
      },
    );
  }
}
