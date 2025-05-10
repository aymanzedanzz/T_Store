import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/home/home.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

import 'features/personalization/screens/settings/settings.dart';
import 'features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController(), permanent: true);
    // final dark = THelperFunctions.isDarkMode(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          backgroundColor: isDark ? TColors.black : TColors.white,
          indicatorColor:
              isDark
                  ? TColors.white.withAlpha((0.1 * 255).toInt())
                  : TColors.black.withAlpha((0.1 * 255).toInt()),

          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      // body: Obx(() => controller.screens[controller.selectedIndex.value]),
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.screens,
        ),
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    HomeScreen(),
    StoreScreen(),
    FavouriteScreen(),
    SettingsScreen(),
  ];
}
