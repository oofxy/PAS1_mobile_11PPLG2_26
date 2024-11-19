import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/teams_model.dart';

class ApiService {
  final String baseUrl1 = 'https://www.thesportsdb.com/api/v1/json/3';
  static const String baseUrl = "https://mediadwi.com/api/latihan";

  Future<List<TeamsModel>> fetchTeams() async {
    final response1 = await http.get(Uri.parse('$baseUrl1/search_all_teams.php?l=English%20Premier%20League'));

    if (response1.statusCode == 200) {
      final data = json.decode(response1.body);
      List teamsData = data['teams'] ?? [];
      return teamsData.map((json) => TeamsModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load teams');
    }
  }

  static Future<Map<String, dynamic>> login(String username, String password) async {
    final url = Uri.parse("$baseUrl/login");

    final requestBody = {
      "username": username,
      "password": password,
    };

    final response = await http.post(
      url,
      body: requestBody,
    );

    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to log in. Status code: ${response.statusCode}");
    }
  }

  static Future<Map<String, dynamic>> register(String username, String password, String fullName, String email) async {
    final url = Uri.parse("$baseUrl/register-user");

    final requestBody = {
      "username": username,
      "password": password,
      "full_name": fullName,
      "email": email,
    };

    final response = await http.post(
      url,
      body: requestBody,
    );

    print('Registration Response body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Failed to register. Status code: ${response.statusCode}");
    }
  }
}