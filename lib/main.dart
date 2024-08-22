import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swappes/bloc/auth_bloc.dart';
import 'package:swappes/bloc/post_bloc.dart';
import 'package:swappes/models/services/api.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/splash_screen.dart';
import 'package:swappes/views/create_post.dart';
import 'package:swappes/views/login.dart';
import 'package:swappes/views/main.dart';
import "package:timeago/timeago.dart" as timeago;

final GoRouter _router =
    GoRouter(initialLocation: "/loading", debugLogDiagnostics: true, routes: [
  GoRoute(
    path: "/loading",
    name: "SplashPage",
    builder: (context, state) => SplashScreenUI(),
  ),
  GoRoute(
      path: "/login",
      name: "LoginPage",
      builder: (context, state) => LoginPage()),
  GoRoute(
    path: "/",
    name: "MainPage",
    builder: (context, state) => const MainPage(),
  ),
  GoRoute(
    path: "/create",
    name: "CreatePost",
    builder: (context, state) => const CreatePostUI(),
  )
]);
void main() async {
  timeago.setLocaleMessages("id", timeago.IdMessages());
  runApp(ChangeNotifierProvider(
      builder: (context, _) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => PostBloc(),
              ),
              BlocProvider(
                create: (_) => AuthBloc(),
              )
            ],
            child: const MainApp(),
          ),
      create: (context) => Profile()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            inputDecorationTheme: const InputDecorationTheme(
                contentPadding: EdgeInsets.all(0),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                  disabledBackgroundColor: Colors.black54,
                  minimumSize: const Size(0, 0),
                  backgroundColor: const Color(0xFF18191A),
                  padding: const EdgeInsets.all(16),
                  // textStyle: const TextStyle(
                  //     color: Colors.black, fontWeight: FontWeight.w600),
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
                    disabledBackgroundColor: Colors.black54,
                    backgroundColor: Colors.transparent,
                    overlayColor: Colors.transparent,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    iconColor: Colors.black)),
            scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241)),
        routerConfig: _router,
      ),
    );
  }
}
