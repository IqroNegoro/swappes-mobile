
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/cubit/auth_cubit.dart';
import 'package:swappes/providers/profile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController =
      TextEditingController(text: "iqronegoro0@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "iqro");

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthCubit>().state;

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
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  state.maybeWhen(
                      success: (user) {
                        context.read<Profile>().saveUser(user);
                        context.goNamed("MainPage");
                      },
                      orElse: () => null);
                },
                child: TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: authState.maybeWhen(
                      loading: () => null,
                      orElse: () => () => context.read<AuthCubit>().login(
                          emailController.text, passwordController.text)),
                  child: const Text(
                    "Masuk",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: () => context.goNamed("RegisterPage"),
                  child: const Row(children: [
                    Text("Belom punya akun? ",
                        style: TextStyle(color: Colors.black)),
                    Text("Buat yuk!",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600)),
                  ]))
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
