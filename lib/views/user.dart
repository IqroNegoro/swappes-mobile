import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/models/avatar.dart';
import 'package:swappes/models/friend.dart';
import 'package:swappes/models/user.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/ui/friend.skeleton.dart';
import 'package:swappes/ui/post.dart';
import 'package:swappes/ui/post_skeleton.dart';
import 'package:swappes/ui/user_friends.dart';

class UserPage extends StatefulWidget {
  final String userId;

  const UserPage(this.userId, {super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late PostCubit _cubit;
  late PostCubit _event;

  Future<User> getUser() async {
    final data = await Api.dio.get("users/${widget.userId}");
    final User user = User.fromJson(data.data['data']);
    return user;
  }

  Future<List<Friend>> getFriends() async {
    final data = await Api.dio.get("users/${widget.userId}/friends");
    List<Friend> friends = [];
    for (final friend in data.data['data']) {
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
                            imageUrl: snapshot.data?.banner['url'] ?? "",
                            placeholder: (_, url) => const Skeletonizer(
                              effect: PulseEffect(),
                              child: Bone.square(
                                size: double.infinity,
                              ),
                            ),
                            errorWidget: (_, __, ___) => Container(
                              color: Colors.black38,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(0, -100),
                          child: Column(
                            children: [
                              UserAvatar(
                                userId: widget.userId,
                                avatar: snapshot.data?.avatar,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 30),
                              Column(
                                children: [
                                  const Text(
                                    "Friends",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(snapshot.data!.friends.toString()),
                                  const SizedBox(height: 30),
                                  Consumer<Profile>(
                                    builder: (__, value, _) => value.id ==
                                            widget.userId
                                        ? const SizedBox()
                                        : TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              padding: const EdgeInsets.all(0),
                                            ),
                                            onPressed: () {},
                                            child: TextButton.icon(
                                              style: const ButtonStyle(
                                                  backgroundColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.black),
                                                  iconColor:
                                                      WidgetStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {},
                                              label: const Text(
                                                "Add Friend",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              icon:
                                                  const Icon(Icons.person_add),
                                            )),
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            "Friends (${snapshot.data!.friends})",
                                            style:
                                                const TextStyle(fontSize: 20)),
                                        const Spacer(),
                                        TextButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  isScrollControlled: true,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  builder: (context) =>
                                                      UserFriendsUI(
                                                          snapshot.data!.id,
                                                          snapshot.data!.name));
                                            },
                                            style: TextButton.styleFrom(
                                                backgroundColor:
                                                    Colors.transparent),
                                            child: const Text("See all friends",
                                                style: TextStyle(
                                                    color: Colors.black))),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    FutureBuilder(
                                      future: getFriends(),
                                      builder: (context, snapshot) {
                                        return !snapshot.hasData
                                            ? const SizedBox()
                                            : GridView(
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                gridDelegate:
                                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                                  maxCrossAxisExtent:
                                                      MediaQuery.sizeOf(context)
                                                              .width /
                                                          3,
                                                  crossAxisSpacing: 0,
                                                  mainAxisSpacing: 10,
                                                ),
                                                children: List.generate(
                                                  snapshot.data!.length,
                                                  (index) => ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0)),
                                                    onPressed: () => context
                                                        .pushNamed("UserId",
                                                            pathParameters: {
                                                          "id": snapshot
                                                              .data![index]
                                                              .user
                                                              .id
                                                        }),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Expanded(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                            child: AspectRatio(
                                                              aspectRatio:
                                                                  1 / 1,
                                                              child:
                                                                  CachedNetworkImage(
                                                                cacheKey: snapshot
                                                                        .data![
                                                                            index]
                                                                        .user
                                                                        .avatar[
                                                                    'url'],
                                                                imageUrl: snapshot
                                                                        .data![
                                                                            index]
                                                                        .user
                                                                        .avatar['url'] ??
                                                                    "",
                                                                fit: BoxFit
                                                                    .cover,
                                                                errorWidget: (context,
                                                                        url,
                                                                        error) =>
                                                                    Container(
                                                                  color: Colors
                                                                      .black12,
                                                                  child: const Center(
                                                                      child: Text(
                                                                          "Image Cannot Displayed")),
                                                                ),
                                                                placeholder: (context,
                                                                        url) =>
                                                                    const Skeletonizer(
                                                                  effect:
                                                                      PulseEffect(),
                                                                  child: Bone
                                                                      .square(
                                                                    size: double
                                                                        .infinity,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .user.name,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
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
                            ],
                          ),
                        ),
                      ],
                    )
                  : const SizedBox();
            },
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Posts",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24)),
          ),
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

class UserAvatar extends StatefulWidget {
  final String userId;
  final Avatar? avatar;
  const UserAvatar({required this.userId, this.avatar, super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  File? _avatar;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _avatar = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(
      builder: (_, value, __) => GestureDetector(
        onTap: () {
          value.id == widget.userId ? getImageFromGallery() : false;
        },
        child: _avatar != null
            ? ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(9999)),
                child: Image.file(
                  fit: BoxFit.cover,
                  _avatar!,
                  width: 150,
                  height: 150,
                ),
              )
            : CachedNetworkImage(
                width: 150,
                height: 150,
                alignment: Alignment.topLeft,
                fit: BoxFit.cover,
                imageUrl: widget.avatar?.url ?? "",
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                ),
                errorWidget: (context, url, error) => const CircleAvatar(
                    backgroundColor: Color.fromRGBO(124, 124, 124, 1)),
                placeholder: (context, url) => const Skeletonizer(
                  effect: PulseEffect(),
                  child: Bone.circle(size: 2 * 20),
                ),
              ),
      ),
    );
  }
}
