import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg_26/controllers/library_controller.dart';
import 'package:pas1_mobile_11pplg_26/models/teams_model.dart';
import '../detail_page.dart';
import 'package:get/get.dart';

class TeamAdapter extends StatelessWidget {
  final TeamsModel teamsModel;

  const TeamAdapter({super.key, required this.teamsModel});

  @override
  Widget build(BuildContext context) {
    final LibraryController controller = Get.put(LibraryController());

    return Obx(() {
      return Card(
        color: Color(0xffffffff),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    Detailpage(
                      badge: teamsModel.strBadge,
                      logo: teamsModel.strLogo,
                      id: teamsModel.idTeam,
                      team: teamsModel.strTeam,
                      country: teamsModel.strCountry,
                      stadium: teamsModel.strStadium,
                      description: teamsModel.strDescriptionEN,
                    ),
              ),
            );
          },
          child: ListTile(
            leading: Image.network(teamsModel.strBadge),
            title: Text(teamsModel.strTeam),
            subtitle: Text(teamsModel.strCountry),
            trailing: IconButton(
              onPressed: () async {
                if (teamsModel.isFavorite.value) {
                  if (teamsModel.id != null) {
                    controller.deleteTask(teamsModel.id!);
                  }
                } else {
                  int newId = await controller.addTask(teamsModel);
                  if (newId != -1) {
                    teamsModel.id = newId;
                  }
                }
                teamsModel.isFavorite.toggle();
              },
              icon: Icon(teamsModel.isFavorite.value ? Icons.bookmark : Icons
                  .bookmark_border),
            ),
          ),
        ),
      );
    });
  }
}
