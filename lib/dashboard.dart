import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/responsive_layout.dart';
import 'controllers/dashboard_controller.dart';
import 'controllers/responsive_controller.dart';
import 'menus/library_menu.dart';
import 'menus/profile_menu.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.put(DashboardController());
    final ResponsiveController responsiveController =
        Get.put(ResponsiveController());

    final screenWidth = MediaQuery.of(context).size.width;

    final List<Widget> menus = [
      const ResponsiveLayout(),
      const LibraryMenu(),
      const ProfileMenu()
    ];

    return Obx(() {
      responsiveController.screenWidth.value = screenWidth;

      return Scaffold(
        body: menus[dashboardController.selectedIndex.value],
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            currentIndex: dashboardController.selectedIndex.value,
            onTap: dashboardController.changeMenu,
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: "Home",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.library_music_rounded),
                label: "Library",
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: "Profile",
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      );
    });
  }
}
