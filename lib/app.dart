import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:payrollapp/app_router.dart';
import 'package:payrollapp/core/theme/app_theme.dart';
import 'package:payrollapp/feature/auth/presentation/screen/splash_screen.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute:SplashScreen.routeName,
      getPages: AppRouter.routers,
      theme: AppTheme.themeData,
    );
  }
}
