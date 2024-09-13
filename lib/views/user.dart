import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/models/friend.dart';
import 'package:swappes/models/user.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/ui/friend.skeleton.dart';
import 'package:swappes/ui/post.dart';
import 'package:swappes/ui/post_skeleton.dart';

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage(this.userId, {super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late User user;

  late PostCubit _cubit;
  late PostCubit _event;

  Future<User> getUser() async {
    final data = await Api.dio.get("users/${widget.userId}");
    user = User.fromJson(data.data['data']);
    return user;
  }

  Future<List<Friend>> getFriends() async {
    final data = await Api.dio.get("users/${widget.userId}/friends");
    List<Friend> friends = [];
    for (final friend in data.data['data']) {
      log(friend.toString());
      friends.add(Friend.fromJson(friend));
    }
    return friends;
  }

  @override
  void initState() {
    super.initState();
    _cubit = PostCubit();
    _event = _cubit..getPostsUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Swappes"),
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
      body: ListView(
        cacheExtent: 9999,
        children: [
          FutureBuilder<User>(
            future: getUser(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: CachedNetworkImage(
                            imageUrl:
                                "https://w0.peakpx.com/wallpaper/647/193/HD-wallpaper-video-game-arknights-irene-arknights.jpg",
                            placeholder: (_, url) => const Skeletonizer(
                              effect: PulseEffect(),
                              child: Bone.square(
                                size: double.infinity,
                              ),
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -100),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(2.0),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black54),
                                child: CachedNetworkImage(
                                  width: 150,
                                  height: 150,
                                  alignment: Alignment.topLeft,
                                  fit: BoxFit.cover,
                                  imageUrl:
                                      "https://static.zerochan.net/Irene.%28Arknights%29.full.3635479.jpg",
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                  ),
                                  errorWidget: (context, url, error) =>
                                      const CircleAvatar(
                                          backgroundColor: Colors.black12),
                                  placeholder: (context, url) =>
                                      const Skeletonizer(
                                    effect: PulseEffect(),
                                    child: Bone.circle(size: 2 * 20),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 30),
                              Column(children: [
                                const Text(
                                  "Friends",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Text(snapshot.data!.friends.toString()),
                                const SizedBox(height: 30),
                                TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      padding: const EdgeInsets.all(0),
                                    ),
                                    onPressed: () {},
                                    child: TextButton.icon(
                                      style: const ButtonStyle(
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  Colors.black),
                                          iconColor: WidgetStatePropertyAll(
                                              Colors.white)),
                                      onPressed: () {},
                                      label: const Text(
                                        "Add Friend",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      icon: const Icon(Icons.person_add),
                                    ))
                              ])
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Friends (${user.friends})",
                        style: const TextStyle(fontSize: 20)),
                    const Spacer(),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent),
                        child: const Text("See all friends",
                            style: TextStyle(color: Colors.black))),
                  ],
                ),
                const SizedBox(height: 10),
                FutureBuilder(
                  future: getFriends(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? const SizedBox()
                        : GridView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                                  MediaQuery.sizeOf(context).width / 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                            ),
                            children: List.generate(
                              snapshot.data!.length,
                              (index) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(0)),
                                onPressed: () => context.pushNamed("UserId",
                                    pathParameters: {
                                      "id": snapshot.data![index].user.id
                                    }),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(12)),
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: CachedNetworkImage(
                                            cacheKey: snapshot.data![index].user
                                                .avatar['url'],
                                            imageUrl: snapshot.data![index].user
                                                .avatar['url'],
                                            fit: BoxFit.cover,
                                            errorWidget:
                                                (context, url, error) =>
                                                    Container(
                                              color: Colors.black12,
                                              child: const Center(
                                                  child: Text(
                                                      "Image Cannot Displayed")),
                                            ),
                                            placeholder: (context, url) =>
                                                const Skeletonizer(
                                              effect: PulseEffect(),
                                              child: Bone.square(
                                                size: double.infinity,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      snapshot.data![index].user.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BlocBuilder<PostCubit, PostState>(
            bloc: _event,
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
                return const Center(child: Text("Post cannot be loaded"));
              } else if (state.status == PostStatus.loaded) {
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.posts.length,
                  itemBuilder: (_, index) =>
                      Post(post: state.posts[index], bloc: _cubit),
                );
              }
              return const PostSkeleton();
            },
          )
        ],
      ),
    );
  }
}
