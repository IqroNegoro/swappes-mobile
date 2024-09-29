import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/avatar.dart';

class AppBarUI extends StatelessWidget implements PreferredSizeWidget {
  bool back;
  String title;
  AppBarUI({this.title = "Swappes", this.back = true, super.key});

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color.fromARGB(255, 241, 241, 241),
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: back,
      actions: [
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: GoRouter.of(context)
                          .routeInformationProvider
                          .value
                          .uri
                          .toString() ==
                      "/"
                  ? Colors.black26
                  : Colors.transparent),
          icon: const Icon(Icons.home),
          onPressed: () => context.goNamed("MainPage"),
        ),
        IconButton(
          style: IconButton.styleFrom(
              backgroundColor: GoRouter.of(context)
                          .routeInformationProvider
                          .value
                          .uri
                          .toString() ==
                      "/notifications"
                  ? Colors.black26
                  : Colors.transparent),
          icon: const Icon(Icons.notifications),
          onPressed: () => context.pushNamed("NotificationsPage"),
        ),
        ElevatedButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Consumer<Profile>(
                    builder: (_, value, __) => ElevatedButton(
                      onPressed: () => context.pushNamed("UserId",
                          pathParameters: {"id": context.read<Profile>().id!}),
                      style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                      child: Row(
                        children: [
                          AvatarUI(avatar: value.avatar!),
                          const SizedBox(width: 15),
                          Text(
                            value.name!,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton.icon(
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    label: const Text(
                      "Log Out",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    // lanjut logout button
                  )
                ],
              ),
            ),
          ),
          child: Selector<Profile, Avatar?>(
            selector: (_, value) => value.avatar,
            builder: (context, value, _) => AvatarUI(avatar: value!),
          ),
        )
      ],
    );
  }
}
