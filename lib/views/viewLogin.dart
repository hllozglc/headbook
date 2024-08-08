import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headbook/services/userService.dart';
import 'package:headbook/views/viewRegister.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  UserService _userService = UserService();
  TextEditingController email = TextEditingController();

  void setUser() async {
    await _userService.loginUser(email.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giriş Yap'),
        actions: [
          TextButton.icon(
            label: const Icon(Icons.person_add_rounded),
            onPressed: () {
              Get.to(const Register());
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'E-Mail'),
          controller: email,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(
          onPressed: () {
            _userService.loginUser(email.text);
          },
          child: const Text('Giriş'),
        ),
      ),
    );
  }
}
