import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../adapter/team_adapter.dart';
import '../../controllers/home_controller.dart';

class HomeMenuTabletLayout extends StatelessWidget {
  const HomeMenuTabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3,
          ),
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
