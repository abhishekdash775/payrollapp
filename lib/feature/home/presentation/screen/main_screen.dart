import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:payrollapp/feature/home/presentation/controller/main_controller.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/mainScreen";
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Theme.of(context).cardColor,
            currentIndex: controller.currentIndex,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.house500),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.shoppingCart500),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.package500),
                label: "Orders",
              ),
              BottomNavigationBarItem(
                icon: Icon(LucideIcons.circleUser),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
