import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/app_bar.dart';
import 'package:swappes/ui/avatar.dart';
import 'package:swappes/ui/post.dart';
import 'package:swappes/ui/post_skeleton.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarUI(),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Profile>(
                      builder: (context, value, _) => Row(
                        children: [
                          AvatarUI(avatar: value.avatar!),
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
