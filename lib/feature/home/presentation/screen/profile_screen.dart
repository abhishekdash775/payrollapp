import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payrollapp/feature/home/presentation/controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                CircleAvatar(
                  radius: 16,
                  child: const Icon(Icons.edit, size: 16),
                ),
              ],
            ),

            const SizedBox(height: 30),
            TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                labelText: "Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              readOnly: true,
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: controller.addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: "Address",
                prefixIcon: Icon(Icons.location_on),
              ),
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              child: Obx(() {
                return ElevatedButton(
                  onPressed: controller.isSaving.value
                      ? null
                      : controller.saveProfile,
                  child: controller.isSaving.value
                      ? const CircularProgressIndicator()
                      : Text(
                          "Save Changes",
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                        ),
                );
              }),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.logout,
                child: Text(
                  "Logout",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
