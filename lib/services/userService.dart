import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:headbook/models/userModel.dart';
import 'package:headbook/views/viewHome.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String token = 'edb1ef4962d6307a27c3ccee9d7974b6a47fb3c8bf23a950be6f7019dc358e29';
  final String url = 'https://gorest.co.in/public/v2/users';
  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> jsonBody = jsonDecode(response.body);
      final List<UserModel> users = jsonBody.map((json) => UserModel.fromJson(json)).toList();

      return users;
    }
    return [];
  }

  Future<void> postUser({required String name, required String email, required String gender}) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'gender': gender,
        'status': 'active',
      }),
    );

    // Response kontrolü
    if (response.statusCode == 201) {
      print('Kullanıcı başarıyla eklendi.');
      print('AD----$name');
      print('mail----$email');
      print('cinsiyet----$gender');
    } else {
      print('Kullanıcı eklenirken hata oluştu: ${response.statusCode}');
    }
  }

  Future loginUser(String email) async {
    final response = await http.get(Uri.parse(url));
    final List<dynamic> jsonBody = jsonDecode(response.body);
    final List<UserModel> users = jsonBody.map((json) => UserModel.fromJson(json)).toList();
    for (var i = 0; i < users.length;) {
      if (users[i].email == email) {
        print(true);
      } else {
        print(false);
      }
    }
  }
}
