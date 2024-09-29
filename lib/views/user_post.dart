import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/models/post.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/ui/app_bar.dart';
import 'package:swappes/ui/avatar.dart';
import 'package:swappes/ui/post_comments.dart';
import 'package:swappes/ui/post_skeleton.dart';
import 'package:swappes/ui/share_post.dart';
import 'package:swappes/ui/shared_post.dart';
import 'package:timeago/timeago.dart' as timeago;

class UserPost extends StatelessWidget {
  final String postId;
  const UserPost({required this.postId, super.key});

  Future<dynamic> getPost() async {
    late PostModel post;

    var data = await Api.dio.get("posts/$postId");

    post = PostModel.fromJson(data.data['data']);

    return post;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarUI(back: false),
        body: FutureBuilder<dynamic>(
          future: getPost(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const PostSkeleton()
              : snapshot.hasError
                  ? Center(
                      child: Column(
                        children: [
                          const Text("Oops something wrong"),
                          const SizedBox(height: 20),
                          TextButton(
                              onPressed: () => getPost(),
                              child: const Text("Try Again",
                                  style: TextStyle(color: Colors.white)))
                        ],
                      ),
                    )
                  : snapshot.hasData
                      ? Wrap(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () => context.pushNamed(
                                              "UserId",
                                              pathParameters: {
                                                "id": snapshot.data!.user.id
                                              }),
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.all(0),
                                          minimumSize: const Size(0, 0),
                                          backgroundColor: Colors.transparent),
                                      child: AvatarUI(
                                          avatar: snapshot.data!.user.avatar)),
                                  const SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 15,
                                        child: TextButton(
                                          onPressed: () => context.pushNamed(
                                              "UserId",
                                              pathParameters: {
                                                "id": snapshot.data!.user.id
                                              }),
                                          style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.transparent,
                                              padding: const EdgeInsets.all(0)),
                                          child: Text(
                                            snapshot.data!.user.name,
                                            style: const TextStyle(
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Text(timeago
                                          .format(DateTime.parse(
                                              snapshot.data!.createdAt))
                                          .toString())
                                    ],
                                  ),
                                  const Spacer(flex: 1),
                                  ElevatedButton(
                                    onPressed: () => showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (_) => Consumer<Profile>(
                                        builder: (_, value, child) {
                                          return SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                value.id ==
                                                        snapshot.data!.user.id
                                                    ? TextButton.icon(
                                                        onPressed: () {
                                                          context.pop();
                                                          context.pushNamed(
                                                              "EditPost",
                                                              pathParameters: {
                                                                "id": postId
                                                              });
                                                        },
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            iconColor:
                                                                Colors.black),
                                                        label: const Text(
                                                            "Edit Post",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        icon: const Icon(
                                                            Icons.edit),
                                                      )
                                                    : const SizedBox(),
                                                TextButton.icon(
                                                  onPressed: () async =>
                                                      await Clipboard.setData(
                                                              ClipboardData(
                                                                  text:
                                                                      "https://swappes.netlify.app/posts/$postId"))
                                                          .then((_) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                            const SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      content: Text(
                                                        "Copied!",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      showCloseIcon: true,
                                                      backgroundColor:
                                                          Color(0xFF18191A),
                                                    ));
                                                    context.pop();
                                                  }),
                                                  style: TextButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.transparent,
                                                      iconColor: Colors.black),
                                                  label: const Text("Copy Link",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500)),
                                                  icon: const Icon(Icons.link),
                                                ),
                                                BlocConsumer<PostCubit,
                                                    PostState>(
                                                  listener: (_, state) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      behavior: SnackBarBehavior
                                                          .floating,
                                                      content: Text(
                                                        state.status ==
                                                                PostStatus
                                                                    .saving
                                                            ? "Saving..."
                                                            : state.status ==
                                                                    PostStatus
                                                                        .deleting
                                                                ? "Deleting..."
                                                                : "Succees",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      showCloseIcon: true,
                                                      backgroundColor:
                                                          const Color(
                                                              0xFF18191A),
                                                    ));
                                                    if (state.status ==
                                                        PostStatus.loaded) {
                                                      context.pop();
                                                    }
                                                  },
                                                  builder: (context, state) {
                                                    return TextButton.icon(
                                                        onPressed: () => snapshot
                                                                    .data!
                                                                    .bookmark ==
                                                                null
                                                            ? context.read<PostCubit>().savePost(
                                                                postId)
                                                            : context.read<PostCubit>().deleteSavedPost(
                                                                postId),
                                                        style: TextButton.styleFrom(
                                                            backgroundColor: Colors
                                                                .transparent,
                                                            iconColor:
                                                                Colors.black),
                                                        label: Text(
                                                            snapshot.data!.bookmark == null
                                                                ? "Save"
                                                                : "Saved",
                                                            style: const TextStyle(
                                                                color: Colors.black,
                                                                fontSize: 18,
                                                                fontWeight: FontWeight.w500)),
                                                        icon: Icon(state.posts.firstWhere((element) => element.id == postId).bookmark != null ? Icons.bookmark_remove : Icons.bookmark_add)
                                                        // listener: (_, state) {

                                                        // },
                                                        );
                                                  },
                                                ),
                                                value.id ==
                                                        snapshot.data!.user.id
                                                    ? TextButton.icon(
                                                        onPressed: () {
                                                          context
                                                              .read<PostCubit>()
                                                              .deletePost(
                                                                  postId);
                                                          context.pop();
                                                        },
                                                        style: TextButton.styleFrom(
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            iconColor:
                                                                Colors.red),
                                                        label: const Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                        icon: const Icon(
                                                            Icons.delete),
                                                      )
                                                    : const SizedBox()
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    child: const Icon(Icons.more_horiz),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15,
                                  right: 15,
                                  bottom: snapshot.data!.isShare ? 0 : 15),
                              child: Text(snapshot.data!.description ?? ""),
                            ),
                            snapshot.data!.isShare
                                ? snapshot.data!.share == null
                                    ? const SizedBox(
                                        height: 100,
                                        child: Center(
                                            child: Text(
                                                "Shared Post Cannot Loaded")))
                                    : SharedPostUI(
                                        post: snapshot.data!.share ?? "")
                                : GridView(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: MediaQuery.sizeOf(
                                                  context)
                                              .width /
                                          (snapshot.data!.images.length == 1
                                              ? 1
                                              : snapshot.data!.images.length > 1
                                                  ? 2
                                                  : 1),
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                    ),
                                    children: List.generate(
                                      snapshot.data!.images.length,
                                      (index) => ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              snapshot.data!.images.isEmpty ||
                                                      index == 0
                                                  ? const Radius.circular(12)
                                                  : const Radius.circular(0),
                                          topRight: snapshot.data!.images
                                                      .isNotEmpty &&
                                                  (snapshot.data!.images
                                                          .length ==
                                                      1)
                                              ? const Radius.circular(12)
                                              : snapshot.data!.images.length >
                                                          1 &&
                                                      index == 1
                                                  ? const Radius.circular(12)
                                                  : const Radius.circular(0),
                                        ),
                                        child: CachedNetworkImage(
                                          cacheKey: snapshot.data!.images[index]
                                              ['discordId'],
                                          imageUrl: snapshot.data!.images[index]
                                              ['images'],
                                          fit: BoxFit.cover,
                                          errorWidget: (context, url, error) =>
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
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.thumb_up),
                                  const SizedBox(width: 5),
                                  Text(snapshot.data!.likes.length.toString()),
                                  const SizedBox(width: 5),
                                  const Icon(Icons.comment),
                                  const SizedBox(width: 5),
                                  Text(snapshot.data!.comments.toString())
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    context.read<PostCubit>().likePost(postId);
                                  },
                                  label: const Text(
                                    "Like",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  icon: BlocBuilder<PostCubit, PostState>(
                                    buildWhen: (previous, current) =>
                                        current.postId == postId,
                                    builder: (context, state) {
                                      if (state.status == PostStatus.liking) {
                                        return const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(
                                                color: Colors.black,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter,
                                                strokeWidth: 1));
                                      } else {
                                        return const Icon(Icons.thumb_up);
                                      }
                                    },
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius:
                                                BorderRadius.all(Radius.zero)),
                                        builder: (_) => PostCommentsUI(postId));
                                  },
                                  label: const Text(
                                    "Comment",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.comment,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () => showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          SharePostUI(postId)),
                                  label: const Text(
                                    "Share",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  icon: const Icon(
                                    Icons.share,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      : const SizedBox(),
        ));
  }
}
