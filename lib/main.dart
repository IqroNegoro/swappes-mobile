import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swappes/cubit/auth_cubit.dart';
import 'package:swappes/cubit/notification_cubit.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/splash_screen.dart';
import 'package:swappes/views/create_post.dart';
import 'package:swappes/views/edit_post.dart';
import 'package:swappes/views/login.dart';
import 'package:swappes/views/main.dart';
import 'package:swappes/views/notification.dart';
import 'package:swappes/views/register.dart';
import 'package:swappes/views/user.dart';
import "package:timeago/timeago.dart" as timeago;

final GoRouter _router =
    GoRouter(initialLocation: "/loading", debugLogDiagnostics: true, routes: [
  GoRoute(
    path: "/loading",
    name: "SplashPage",
    builder: (context, state) => const SplashScreenUI(),
  ),
  GoRoute(
      path: "/register",
      name: "RegisterPage",
      builder: (context, state) => RegisterPage()),
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
    path: "/notifications",
    name: "NotificationsPage",
    builder: (context, state) => const NotificationsPage(),
  ),
  GoRoute(
    path: "/create",
    name: "CreatePost",
    builder: (context, state) => const CreatePostUI(),
  ),
  GoRoute(
    path: "/edit/:id",
    name: "EditPost",
    builder: (context, state) => EditPostUI(state.pathParameters['id']!),
  ),
  GoRoute(
    path: "/users/:id",
    name: "UserId",
    builder: (context, state) => UserPage(state.pathParameters['id']!),
  ),
]);
void main() async {
  timeago.setLocaleMessages("id", timeago.IdMessages());
  runApp(ChangeNotifierProvider(
      builder: (context, _) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => PostCubit()..getPosts(),
              ),
              BlocProvider(
                create: (_) => AuthCubit(),
              ),
              BlocProvider(
                create: (_) => NotificationCubit()..getNotifications(),
              ),
            ],
            child: const MainApp(),
          ),
      create: (_) => Profile()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (notification) {
          notification.disallowIndicator();

          return true;
        },
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: GoogleFonts.poppins().fontFamily,
              inputDecorationTheme: const InputDecorationTheme(
                  contentPadding: EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1))),
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                    overlayColor: Colors.transparent,
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
              buttonTheme: const ButtonThemeData(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent),
              iconButtonTheme: const IconButtonThemeData(
                  style: ButtonStyle(
                      overlayColor:
                          WidgetStatePropertyAll(Colors.transparent))),
              progressIndicatorTheme:
                  const ProgressIndicatorThemeData(color: Colors.black),
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: Colors.black54,
                      backgroundColor: Colors.transparent,
                      overlayColor: Colors.transparent,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      iconColor: Colors.black)),
              scaffoldBackgroundColor:
                  const Color.fromARGB(255, 241, 241, 241)),
          routerConfig: _router,
        ),
      ),
    );
  }
}
