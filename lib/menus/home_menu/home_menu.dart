import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/adapter/team_adapter.dart';
import 'package:pas1_mobile_11pplg_26/controllers/home_controller.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.teamList.length,
          itemBuilder: (context, index) {
            final team = controller.teamList[index];
            return TeamAdapter(teamsModel: team);
          },
        );
      }),
    );
  }
}
