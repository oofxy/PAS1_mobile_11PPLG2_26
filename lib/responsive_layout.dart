import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/responsive_controller.dart';
import 'menus/home_menu/home_menu.dart';
import 'menus/home_menu/home_menu_tablet_layout.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {

    final ResponsiveController responsiveController = Get.put(ResponsiveController());
    return Obx(() {
      if (responsiveController.isMobile()) {
        return HomeMenu();
      } else {
        return HomeMenuTabletLayout();
      }
    });
  }
}
