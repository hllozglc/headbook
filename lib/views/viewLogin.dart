import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headbook/views/viewRegister.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
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
          decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'E-Mail'),
          controller: email,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(onPressed: () {}, child: const Text('Giriş')),
      ),
    );
  }
}
