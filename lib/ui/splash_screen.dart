import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/bloc/auth_bloc.dart';
import 'package:swappes/providers/profile.dart';

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Center(
          child: BlocListener<AuthBloc, AuthState>(
            bloc: AuthBloc()..add(CheckAuthenticated()),
            listener: (context, state) {
              if (state is Authenticated) {
                context.read<Profile>().saveUser(state.user);
                context.goNamed("MainPage");
              } else if (state is AuthError) {
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
              }
            },
            child: const Text(
              "Swappes",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w100),
            ),
          ),
        ),
      ),
    );
  }
}
