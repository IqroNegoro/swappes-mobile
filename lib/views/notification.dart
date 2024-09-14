import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/notification_cubit.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/notification_skeleton.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Notifications"),
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () => context.pushNamed("NotificationsPage"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Consumer<Profile>(
              builder: (context, value, _) => CachedNetworkImage(
                imageUrl: value.avatar?.url ?? "",
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
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) => ListView(
          children: state.maybeWhen(
            orElse: () => List.generate(
              5,
              (index) => const NotificationSkeleton(),
            ),
            error: (error) => [const Text("Notifications Cannot Loaded")],
            loading: () => [const CircularProgressIndicator()],
            loaded: (notifications) => List.generate(
              notifications.length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      width: 70,
                      height: 70,
                      imageUrl:
                          notifications[index].from['avatar']['url'] ?? "",
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        backgroundImage: imageProvider,
                      ),
                      errorWidget: (_, __, ___) => const CircleAvatar(
                        backgroundImage: AssetImage(
                          ("assets/images/default_profile.png"),
                        ),
                      ),
                      placeholder: (context, url) => const Skeletonizer(
                        effect: PulseEffect(),
                        child: Bone.circle(size: 2 * 20),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                "${notifications[index].from['name']} ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              Text(
                                "${notifications[index].content} ",
                                style: const TextStyle(fontSize: 16),
                              ),
                              Text(
                                "${notifications[index].post['description']} ",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(timeago
                              .format(DateTime.parse(
                                  notifications[index].createdAt))
                              .toString())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
