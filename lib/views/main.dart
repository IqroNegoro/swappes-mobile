import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/post.dart';
import 'package:swappes/ui/post_skeleton.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swappes"),
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
      body: Stack(
        children: [
          RefreshIndicator(
            color: Colors.white,
            backgroundColor: const Color(0xFF18191A),
            onRefresh: () async {
              Future.sync(() {
                context.read<PostCubit>().getPosts();
              });
            },
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (notification) {
                notification.disallowIndicator();
                return true;
              },
              child: ListView(
                children: [
                  ElevatedButton(
                      onPressed: () => context.goNamed("LoginPage"),
                      child: const Text("Balik lu")),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Profile>(
                      builder: (context, value, _) => Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: value.avatar?.url ?? "",
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              backgroundImage: imageProvider,
                            ),
                            errorWidget: (context, url, error) =>
                                const CircleAvatar(
                                    backgroundColor: Colors.black12),
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Skeletonizer(
                              effect: PulseEffect(),
                              child: Bone.circle(size: 2 * 20),
                            ),
                          ),
                          const SizedBox(width: 15),
                          Flexible(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: () => context.pushNamed("CreatePost"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12),
                              child: Text(
                                "Write your thinking now, ${value.name} ?",
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<PostCubit, PostState>(
                    buildWhen: (previous, current) =>
                        current.status != PostStatus.creating &&
                        current.status != PostStatus.liking &&
                        current.status != PostStatus.showComment &&
                        current.status != PostStatus.saving &&
                        current.status != PostStatus.deleting &&
                        current.status != PostStatus.sharing,
                    builder: (context, state) {
                      if (state.status == PostStatus.loading) {
                        return const PostSkeleton();
                      } else if (state.status == PostStatus.error) {
                        return const Center(
                            child: Text("Post cannot be loaded"));
                      } else if (state.status == PostStatus.loaded) {
                        return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.posts.length,
                            itemBuilder: (_, index) => Post(
                                post: state.posts[index],
                                bloc: context.read<PostCubit>()));
                      }
                      return const PostSkeleton();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
