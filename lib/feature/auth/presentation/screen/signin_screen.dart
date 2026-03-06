import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:payrollapp/core/constant/app_asset.dart';
import 'package:payrollapp/core/validators/app_validator.dart';
import 'package:payrollapp/core/widgets/app_loader.dart';
import 'package:payrollapp/feature/auth/presentation/controller/signin_controller.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signup_screen.dart';

class SigninScreen extends GetView<SigninController> {
  static const String routeName = "/signin";
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAsset.logo, height: 200, width: 250),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) => AppValidator.email(value),
                      decoration: InputDecoration(hintText: "Email"),
                    ),
                    SizedBox(height: 15),
                    Obx(
                      () => TextFormField(
                        controller: controller.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => AppValidator.password(value),
                        obscureText: !controller.passwordVisible.value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.passwordVisible.toggle();
                            },
                            icon: Icon(
                              controller.passwordVisible.value
                                  ? LucideIcons.eye500
                                  : LucideIcons.eyeOff500,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Obx(
                      () => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.onSignIn(),
                          child: controller.isLoading.value
                              ? const AppLoader(isDarkBackground: true)
                              : const Text("Sign In"),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          const TextSpan(text: "Don't have an account? "),
                          TextSpan(
                            text: "Sign up here",

                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.offNamed(SignupScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
