import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/controllers/login_controller.dart';
import 'package:pas1_mobile_11pplg_26/widgets/primary_button.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                // Half of height/width for perfect circle
                child: Image.network(
                  "https://plus.unsplash.com/premium_photo-1671656349322-41de944d259b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fHww",
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: 400,
                width: 350,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15,),
                    Text(
                      "Username : " + controller.username.value,
                      style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w800),
                    ),
                    Text(
                      "E-mail : Vardas@yahoo.com",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 17,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 3,),
                    Text(
                      "Full name : Vardas Estefaldo Quan",
                      style: TextStyle(
                        color: Colors.grey,
                          fontSize: 17,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                    ),
                    Expanded(child: Container()),
                    PrimaryButton(onPressed: (){
                      Get.toNamed('/');
                    }, text: "Logout", width: 125, backgroundColour: Color(
                        0xffd93e3e),)
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xffffffff),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
