import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/library_controller.dart';
import '../detail_page.dart';

class LibraryMenu extends StatelessWidget {
  const LibraryMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final LibraryController controller = Get.find();

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: SingleChildScrollView(
        child: Obx(
              () {
            controller.loadTasks();controller.loadTasks();
            if (controller.tasks.isEmpty) {
              return Center(child: Text('No teams in the library.', style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 15,
                fontWeight: FontWeight.w800
              ),));
            }
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.tasks.length,
              itemBuilder: (context, index) {
                final task = controller.tasks[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detailpage(
                            badge: task.strBadge,
                            logo: task.strLogo,
                            id: task.idTeam,
                            team: task.strTeam,
                            country: task.strCountry,
                            stadium: task.strStadium,
                            description: task.strDescriptionEN,
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: Image.network(task.strBadge),
                      title: Text(task.strTeam),
                      subtitle: Text(task.strCountry),
                      trailing: IconButton(
                        onPressed: () {
                          controller.deleteTask(task.id!);
                          task.isFavorite.toggle();
                        },
                        icon: Icon(
                          task.isFavorite.value ? Icons.bookmark_border : Icons.bookmark,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

