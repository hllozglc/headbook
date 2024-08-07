import 'package:flutter/material.dart';
import 'package:headbook/services/userService.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kayıt Ol')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'İsim'),
              controller: name,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'E-Mail'),
              controller: email,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(onPressed: () {
          UserService().postUser(name: name.text, email: email.text);
        }, child: const Text('Kayıt Ol')),
      ),
    );
  }
}
