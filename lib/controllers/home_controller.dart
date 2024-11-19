import 'package:get/get.dart';
import '../api_service.dart';
import '../models/teams_model.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;
  var teamList = <TeamsModel>[].obs;

  @override
  void onInit() {
    fetchCountries();
    super.onInit();
  }

  void fetchCountries() async {
    try {
      isLoading(true);
      var teams = await ApiService().fetchTeams();
      teamList.assignAll(teams);
    } finally {
      isLoading(false);
    }
  }
}
