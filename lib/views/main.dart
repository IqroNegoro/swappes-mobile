import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
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
                context.read<PostCubit>().getPost();
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
                    bloc: context.read<PostCubit>()..getPost(),
                    builder: (_, state) {
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
                            itemBuilder: (_, index) =>
                                Post(post: state.posts[index]));
                      }

                      return const PostSkeleton();
                      // return state.maybeWhen(
                      //   postLoading: () => const PostSkeleton(),
                      //   postError: (errors) => const Center(
                      //     child: Text("Post cannot be loaded"),
                      //   ),
                      //   postLoaded: (posts) => ListView.builder(
                      //       physics: const NeverScrollableScrollPhysics(),
                      //       shrinkWrap: true,
                      //       itemCount: posts.length,
                      //       itemBuilder: (context, index) =>
                      //           Post(post: posts[index])),
                      //   orElse: () => const PostSkeleton(),
                      // );
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
