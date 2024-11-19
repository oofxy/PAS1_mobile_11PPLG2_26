import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg_26/binding.dart';
import 'package:pas1_mobile_11pplg_26/dashboard.dart';
import 'package:pas1_mobile_11pplg_26/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/dashboard', page: () => const Dashboard()),
      ],
      initialBinding: MyBindings(),
    );
  }
}
