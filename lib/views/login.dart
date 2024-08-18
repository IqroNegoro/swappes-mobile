import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/models/services/api.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/storage/storage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController =
      TextEditingController(text: "iqronegoro0@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "iqro");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Swappes",
            style: TextStyle(fontSize: 24),
          ),
          const Spacer(
            flex: 1,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mari Masuk",
                style: TextStyle(fontSize: 24),
              ),
              const Text("Yuk, masuk dengan akun mu untuk melanjutkan"),
              const SizedBox(
                height: 10,
              ),
              const Text("Email",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: "Enter Your Email"),
                controller: emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Password",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Enter Your Password",
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    minimumSize: const Size.fromHeight(50)),
                onPressed: () async {
                  try {
                    var login = await dio.post("login", data: {
                      "email": emailController.text,
                      "password": passwordController.text
                    });

                    await Storage.save(
                        "accessToken", login.data['accessToken']);
                    await Storage.save(
                        "refreshToken", login.data['refreshToken']);

                    dio.options.headers['Authorization'] =
                        "Bearer ${login.data['accessToken']}";

                    if (context.mounted) {
                      context.read<Profile>().saveUser(login.data['user']);
                      context.goNamed("MainPage");
                    }
                  } catch (e) {
                    if (e is DioException) {
                      log(e.toString());
                      // if (e.response!.statusCode == 400) {
                      //   log(e.response!.data.toString());
                      // }
                    }
                  }
                },
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
          const Spacer(
            flex: 1,
          ),
          const Text("Swappes 2024")
        ],
      ),
    ));
  }
}
