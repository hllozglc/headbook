import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:headbook/controllers/appDataController.dart';
import 'package:headbook/services/userService.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AppDataController _controller = Get.find<AppDataController>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  List<String> list = <String>['male', 'famale'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kayıt Ol')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'İsim'),
              controller: name,
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'E-Mail'),
              controller: email,
            ),
            Obx(
              () => DropdownButton<String>(
                hint: const Text('Cinsiyet'),
                value: _controller.categorySelectedItem.value == "" ? null : _controller.categorySelectedItem.value,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(height: 2, color: Colors.deepPurpleAccent),
                onChanged: (newValue) {
                  _controller.upDateSelectedItemCategory(newValue.toString());
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: ElevatedButton(
            onPressed: () {
              UserService().postUser(
                name: name.text,
                email: email.text,
                gender: _controller.categorySelectedItem.value,
              );
            },
            child: const Text('Kayıt Ol')),
      ),
    );
  }
}
