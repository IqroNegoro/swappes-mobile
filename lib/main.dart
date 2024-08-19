import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swappes/bloc/post_bloc.dart';
import 'package:swappes/models/services/api.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/views/create_post.dart';
import 'package:swappes/views/login.dart';
import 'package:swappes/views/main.dart';
import "package:timeago/timeago.dart" as timeago;

final GoRouter _router =
    GoRouter(initialLocation: "/", debugLogDiagnostics: true, routes: [
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
  dio.interceptors.add(InterceptorsWrapper(
    onError: (error, handler) async {
      log("error njir");
      log(error.response.toString());
      // if (error.response?.statusCode == 401) {
      //   log('401');
      //   final refreshToken = await Storage.get("refreshToken");
      //   log(refreshToken ?? "gk ada tokennya");
      //   if (refreshToken != null) {
      //     try {
      //       final response = await dio.post("/info", data: {
      //         "refreshToken": refreshToken,
      //       });
      //       if (response.statusCode == 200) {
      //         await Storage.save("accessToken", response.data['accessToken']);
      //         await Storage.save("refreshToken", response.data['refreshToken']);

      //         dio.options.headers['Authorization'] =
      //             "Bearer ${response.data['accessToken']}";
      //         error.requestOptions.headers['Authorization'] =
      //             "Bearer ${response.data['accessToken']}";
      //         return handler.resolve(await dio.fetch(error.requestOptions));
      //       }
      //     } catch (e) {
      //       log(e.toString());
      //     }
      //   }
      // }
      return handler.next(error);
    },
    onRequest: (options, handler) {
      log("request njir");
      return handler.next(options);
    },
    onResponse: (response, handler) {
      log("response njir");
      return handler.next(response);
    },
  ));
  runApp(ChangeNotifierProvider(
      builder: (context, _) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => PostBloc(),
              )
            ],
            child: const MainApp(),
          ),
      create: (context) => Profile()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // final _scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp.router(
        // scaffoldMessengerKey: _scaffoldKey,
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
