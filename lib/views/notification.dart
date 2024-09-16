import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/notification_cubit.dart';
import 'package:swappes/ui/app_bar.dart';
import 'package:swappes/ui/notification_skeleton.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI(title: "Notifications", back: false),
      body: RefreshIndicator(
        onRefresh: () => context.read<NotificationCubit>().getNotifications(),
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) => state.maybeWhen(
            orElse: () => Column(
              children:
                  List.generate(5, (index) => const NotificationSkeleton()),
            ),
            error: (error) => Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text("Notifications Cannot Loaded",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {
                      context.read<NotificationCubit>().getNotifications();
                    },
                    child: const Text("Try Again",
                        style: TextStyle(color: Colors.white)))
              ],
            )),
            loading: () => ListView(
              children:
                  List.generate(10, (index) => const NotificationSkeleton()),
            ),
            loaded: (notifications) => ListView(
              children: List.generate(
                notifications.length,
                (index) => Container(
                  color: notifications[index].isRead
                      ? Colors.transparent
                      : const Color.fromARGB(69, 120, 194, 255),
                  child: Padding(
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
                          imageBuilder: (context, imageProvider) =>
                              CircleAvatar(
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
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
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
        ),
      ),
    );
  }
}
