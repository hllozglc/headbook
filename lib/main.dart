import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headbook/controllers/mainBindings.dart';
import 'package:headbook/views/viewHome.dart';
import 'package:headbook/views/viewLogin.dart';

void main() {
  MainBindings().dependencies();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
