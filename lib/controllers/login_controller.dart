import 'package:get/get.dart';

import '../api_service.dart';

class LoginController extends GetxController{
  var isObscured = true.obs;
  var isLoading = false.obs;
  var username = "".obs;
  var password = "".obs;
  var loginSuccess = false.obs;
  var errorMessage = "".obs;

  void changeObscured(){
    isObscured.value = !isObscured.value;
  }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final response = await ApiService.login(username.value, password.value);

      if (response['status'] == true) {
        loginSuccess.value = true;
        errorMessage.value = "";
        // Handle the token or other login data here
        String token = response['token'];
        Get.snackbar("Login Success", "Token: $token");
        Get.toNamed('/dashboard');
      } else {
        loginSuccess.value = false;
        errorMessage.value = response['message'] ?? 'Login failed';
        Get.snackbar("Error", errorMessage.value);
      }
    } catch (e) {
      loginSuccess.value = false;
      errorMessage.value = "An error occurred: $e";
      Get.snackbar("Error", errorMessage.value);
    }
    isLoading.value = false;
  }
}