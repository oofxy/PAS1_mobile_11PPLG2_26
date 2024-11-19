import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/widgets/custom_text_field.dart';
import 'package:pas1_mobile_11pplg_26/widgets/primary_button.dart';

import 'controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    return Obx(() {
      return Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 100, left: 35, right: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  Container(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      "We're Happy To See",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 30, top: 40),
                    child: Text(
                      "You Again!",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  height: 5,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                        'https://img.freepik.com/free-vector/hand-drawn-community-spirit-illustration_52683-109031.jpg?semt=ais_hybrid')),
                SizedBox(
                  height: 45,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 24,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Username",
                        hintText: "e.g. Jake123",
                        isObscured: false,
                        onChanged: (value) {
                          controller.username.value = value;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.key,
                      size: 27,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: CustomTextField(
                          labelText: "Passwrod",
                          hintText: "e. g. n3s6h8vf",
                          isObscured: controller.isObscured.value,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          onPressed: () {
                            controller.changeObscured();
                          },
                          iconHide: Icons.visibility_off_outlined,
                          iconShow: Icons.remove_red_eye_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  onPressed: () {
                    controller.login();
                  },
                  backgroundColour: Colors.black,
                  textColour: Colors.white,
                  text: 'Login',
                  width: 167,
                ),
                Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Forget Password?",
                        style: TextStyle(
                            fontFamily: "Roboto",
                            fontSize: 13,
                            fontWeight: FontWeight.w800))),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: Container()),
                SizedBox(
                  height: 70,
                  child: Container(
                    width: 275,
                    margin: EdgeInsets.symmetric(horizontal: 45),
                    child: Text(
                      textAlign: TextAlign.center,
                      "By continuing, your confirm that you agree to our terms and policy",
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
