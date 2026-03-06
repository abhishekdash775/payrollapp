import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:payrollapp/core/constant/app_asset.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signin_screen.dart';
import 'package:payrollapp/feature/home/presentation/screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> bounce;

  @override
  void initState() {
    super.initState();

    /// animation controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    /// bounce animation
    bounce = Tween<double>(
      begin: 0.9,
      end: 1.1,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    /// infinite bounce
    controller.repeat(reverse: true);
    startSplash();
  }

Future<void> startSplash() async {
  await Future.delayed(const Duration(seconds: 2));

  final user = FirebaseAuth.instance.currentUser;

  if (user == null) {
    Get.offAllNamed(SigninScreen.routeName);
  } else {
    Get.offAllNamed(MainScreen.routeName);
  }
}

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ScaleTransition(
          scale: bounce,
          child: SvgPicture.asset(AppAsset.logo, width: 180, height: 120),
        ),
      ),
    );
  }
}
