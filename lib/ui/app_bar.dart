import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/providers/profile.dart';

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
          icon: const Icon(Icons.notifications),
          onPressed: () => context.pushNamed("NotificationsPage"),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Selector<Profile, Avatar?>(
            selector: (_, value) => value.avatar,
            builder: (context, value, _) => CachedNetworkImage(
              imageUrl: value?.url ?? "",
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
              errorWidget: (context, url, error) =>
                  const CircleAvatar(backgroundColor: Colors.black12),
              placeholder: (context, url) => const Skeletonizer(
                effect: PulseEffect(),
                child: Bone.circle(size: 2 * 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
