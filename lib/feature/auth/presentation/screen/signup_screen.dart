import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:payrollapp/core/constant/app_asset.dart';
import 'package:payrollapp/core/validators/app_validator.dart';
import 'package:payrollapp/core/widgets/app_loader.dart';
import 'package:payrollapp/feature/auth/presentation/controller/signup_controller.dart';
import 'package:payrollapp/feature/auth/presentation/screen/signin_screen.dart';

class SignupScreen extends GetView<SignupController> {
  static const String routeName = "/signup";
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: SingleChildScrollView(
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
                                textCapitalization: TextCapitalization.words,
                                autofillHints: [AutofillHints.name],
                                controller: controller.nameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => AppValidator.name(value),
                                decoration: InputDecoration(
                                  hintText: "Full Name",
                                ),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                controller: controller.emailController,
                                autofillHints: [AutofillHints.email],
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) => AppValidator.email(value),
                                decoration: InputDecoration(hintText: "Email"),
                              ),
                              SizedBox(height: 15),
                              TextFormField(
                                textCapitalization:
                                    TextCapitalization.sentences,
                                autofillHints: const [
                                  AutofillHints.fullStreetAddress,
                                ],
                                controller: controller.addressController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) =>
                                    AppValidator.address(value),
                                keyboardType: TextInputType.streetAddress,
                                maxLines: 3,
                                decoration: const InputDecoration(
                                  hintText: "Address",
                                ),
                              ),
                              const SizedBox(height: 15),

                              Obx(
                                () => TextFormField(
                                  controller: controller.passwordController,
                                  autofillHints: [AutofillHints.password],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      AppValidator.password(value),
                                  obscureText:
                                      !controller.passwordVisible.value,
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
                              SizedBox(height: 15),

                              Obx(
                                () => TextFormField(
                                  controller:
                                      controller.confirmPasswordController,
                                  autofillHints: [AutofillHints.password],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) =>
                                      AppValidator.confirmPassword(
                                        value,
                                        controller.passwordController.text,
                                      ),
                                  obscureText:
                                      !controller.confirmPasswordVisible.value,
                                  decoration: InputDecoration(
                                    hintText: "Confirm Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.confirmPasswordVisible
                                            .toggle();
                                      },
                                      icon: Icon(
                                        controller.confirmPasswordVisible.value
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
                                    onPressed: () => controller.onSignup(),
                                    child: controller.isLoading.value
                                        ? const AppLoader(
                                            isDarkBackground: true,
                                          )
                                        : const Text("Sign Up"),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),

                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    const TextSpan(
                                      text: "Already have an account? ",
                                    ),
                                    TextSpan(
                                      text: "Sign in here",

                                      style: TextStyle(
                                        color: Theme.of(
                                          context,
                                        ).colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.offNamed(SigninScreen.routeName);
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
            },
          ),
        ),
      ),
    );
  }
}
