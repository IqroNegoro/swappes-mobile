import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
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
import 'package:swappes/ui/app_bar.dart';
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
    log(user.toString());
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
      appBar: AppBarUI(back: false),
      body: ListView(
        cacheExtent: 9999,
        children: [
          FutureBuilder<User>(
            future: getUser(),
            builder: (context, snapshot) {
              return snapshot.hasData
                  ? Column(
                      children: [
                        UserBanner(
                          userId: widget.userId,
                          banner: snapshot.data?.banner,
                        ),
                        Transform.translate(
                          offset: const Offset(0, -50),
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
                                  FriendButton(
                                      userId: widget.userId,
                                      isFriend: snapshot.data!.isFriend)
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
                                                                errorWidget: (_,
                                                                        __,
                                                                        ___) =>
                                                                    Image.asset(
                                                                        "assets/images/default_profile.png"),
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
            // buildWhen: (previous, current) =>
            //     current.status != PostStatus.creating &&
            //     current.status != PostStatus.liking &&
            //     current.status != PostStatus.showComment &&
            //     current.status != PostStatus.saving &&
            //     current.status != PostStatus.deleting &&
            //     current.status != PostStatus.sharing,
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
        onTap: () async {
          if (value.id == widget.userId) {
            final pickedFile =
                await picker.pickImage(source: ImageSource.gallery);

            if (pickedFile != null) {
              setState(() {
                _avatar = File(pickedFile.path);
              });
            }

            if (_avatar != null && context.mounted) {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                barrierColor: Colors.transparent,
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text("Change profile picture?",
                          style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              child: const Text("Cancel",
                                  style: TextStyle(color: Colors.white)),
                              onPressed: () {
                                setState(() {
                                  _avatar = null;
                                  context.pop();
                                });
                              },
                            ),
                            const SizedBox(width: 20),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<Profile>()
                                    .updateAvatar(_avatar!)
                                    .then((value) {
                                  context.pop();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      behavior: SnackBarBehavior.floating,
                                      content: Text(
                                        value
                                            ? 'Profile picture changed'
                                            : 'Error, try again',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      showCloseIcon: true,
                                      backgroundColor: const Color(0xFF18191A),
                                    ),
                                  );
                                });
                              },
                              child: const Text("Upload",
                                  style: TextStyle(color: Colors.white)),
                            )
                          ]),
                    ],
                  ),
                ),
              );
            }
          }
        },
        child: _avatar != null
            ? ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(9999)),
                child: Image.file(
                  _avatar!,
                  fit: BoxFit.cover,
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

class UserBanner extends StatefulWidget {
  final String userId;
  final dynamic banner;
  const UserBanner({required this.userId, this.banner, super.key});

  @override
  State<UserBanner> createState() => _UserBannerState();
}

class _UserBannerState extends State<UserBanner> {
  File? _banner;
  final picker = ImagePicker();

  bool isLoading = false;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _banner = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(
      builder: (_, value, __) => GestureDetector(
        onTap: () => value.id == widget.userId ? getImageFromGallery() : false,
        child: Stack(
          alignment: const Alignment(0.95, 0.9),
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _banner != null
                  ? Image.file(
                      _banner!,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      cacheKey: widget.banner?['url'],
                      imageUrl: widget.banner?['url'] ?? "",
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
            _banner != null
                ? Column(
                    children: [
                      TextButton(
                        child: Selector<Profile, bool>(
                          selector: (_, value) => value.isLoadingBanner,
                          builder: (_, value, __) => Text(
                              value ? "Uploading" : "Upload",
                              style: const TextStyle(color: Colors.white)),
                        ),
                        onPressed: () {
                          context
                              .read<Profile>()
                              .updateBanner(_banner!)
                              .then((value) => value ? _banner = null : "");
                        },
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        child: const Text("Cancel",
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => setState(() {
                          _banner = null;
                        }),
                      ),
                    ],
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class FriendButton extends StatefulWidget {
  String userId;
  Map<String, dynamic>? isFriend;
  FriendButton({required this.userId, required this.isFriend, super.key});

  @override
  State<FriendButton> createState() => _FriendButtonState();
}

class _FriendButtonState extends State<FriendButton> {
  dynamic data;
  bool isLoading = false;

  Future<void> addFriend() async {
    Response response;
    setState(() {
      isLoading = false;
    });
    try {
      response = await Api.dio.post("users/${widget.userId}/friends");

      setState(() {
        data = response.data['data'];
        widget.isFriend = response.data['data'];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> acceptFriend() async {
    Response response;
    try {
      setState(() {
        isLoading = true;
      });
      response = await Api.dio.put("users/${widget.userId}/friends");

      setState(() {
        widget.isFriend!['status'] = response.data['data'];
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> deleteFriend() async {
    Response response;
    try {
      setState(() {
        isLoading = true;
      });
      response = await Api.dio.delete("users/${widget.userId}/friends");

      setState(() {
        widget.isFriend = null;
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Profile>(
      builder: (__, value, _) => value.id == widget.userId
          ? const SizedBox()
          : TextButton.icon(
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(15),
                  backgroundColor: (widget.isFriend?['status']) == 0 ||
                          (widget.isFriend?['status']) == 1 &&
                              (widget.isFriend?['to']) == value.id
                      ? Colors.blue.shade600
                      : Colors.black,
                  iconColor: Colors.white),
              onPressed: isLoading
                  ? null
                  : () => widget.isFriend == null
                      ? addFriend()
                      : widget.isFriend!['status'] == 0 &&
                              widget.isFriend!['to'] == value.id
                          ? acceptFriend()
                          : deleteFriend(),
              label: Text(
                widget.isFriend != null
                    ? (widget.isFriend?['status']) == 0 &&
                            (widget.isFriend?['to']) == value.id
                        ? "Accept Friend"
                        : (widget.isFriend?['status']) == 0
                            ? "Cancel Request"
                            : "Friend"
                    : "Add Friend",
                style: const TextStyle(color: Colors.white),
              ),
              icon: Icon(widget.isFriend != null
                  ? ((widget.isFriend?['status']) == 0 &&
                              (widget.isFriend?['to']) == value.id) ||
                          (widget.isFriend?['status']) == 1
                      ? Icons.check
                      : Icons.person_remove
                  : Icons.person_add),
            ),
    );
  }
}
