
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/cubit/auth_cubit.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController nameController =
      TextEditingController(text: "Nadila");
  final TextEditingController emailController =
      TextEditingController(text: "nadila@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "nadila");

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
                "Yuk, Bikin Akun",
                style: TextStyle(fontSize: 24),
              ),
              const Text("Bikin akun dulu untuk melanjutkan"),
              const SizedBox(
                height: 10,
              ),
              const Text("Nama",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              TextField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Enter Your Name"),
                controller: nameController,
              ),
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
                      success: (_) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                            "Register success, Please log in",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          showCloseIcon: true,
                          backgroundColor: Color(0xFF18191A),
                        ));
                        context.goNamed("LoginPage");
                      },
                      orElse: () => null);
                },
                child: TextButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50)),
                  onPressed: authState.maybeWhen(
                      loading: () => null,
                      orElse: () => () => context.read<AuthCubit>().register(
                          nameController.text,
                          emailController.text,
                          passwordController.text)),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
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
