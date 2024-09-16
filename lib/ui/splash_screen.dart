import "package:flutter_animate/flutter_animate.dart";
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/cubit/auth_cubit.dart';
import 'package:swappes/providers/profile.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: BlocListener<AuthCubit, AuthState>(
            bloc: AuthCubit()..checkAuthenticated(),
            listener: (context, state) {
              state.maybeWhen(
                  success: (user) {
                    context.read<Profile>().saveUser(user);
                    context.goNamed("MainPage");
                  },
                  error: (error) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(
                        "Session timeout, please login again",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      showCloseIcon: true,
                      backgroundColor: Color(0xFF18191A),
                    ));
                    context.goNamed("LoginPage");
                  },
                  orElse: () => null);
            },
            child: const Text(
              "Swappes",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
            ).animate().fadeIn().slideY(
                begin: 1,
                end: 0,
                duration: const Duration(milliseconds: 500),
                curve: const Cubic(0, 0.5, 0, 1)),
          ),
        ),
      ),
    );
  }
}
