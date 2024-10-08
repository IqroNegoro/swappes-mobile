import "dart:developer";

import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:skeletonizer/skeletonizer.dart";
import "package:swappes/bloc/post_bloc.dart";
import "package:swappes/models/post.dart";
import "package:timeago/timeago.dart" as timeago;

class Post extends StatelessWidget {
  final PostModel post;
  const Post({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: post.user.avatar.url ?? "",
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
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.user.name,
                    style: const TextStyle(
                        letterSpacing: 0.5, fontWeight: FontWeight.w600),
                  ),
                  Text(
                      timeago.format(DateTime.parse(post.createdAt)).toString())
                ],
              ),
              const Spacer(flex: 1),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Text(post.description!),
        ),
        GridView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.sizeOf(context).width /
                (post.images.length == 1
                    ? 1
                    : post.images.length > 1
                        ? 2
                        : 1),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          children: List.generate(
            post.images.length,
            (index) => ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: post.images.isEmpty || index == 0
                    ? const Radius.circular(12)
                    : const Radius.circular(0),
                topRight: post.images.isNotEmpty && (post.images.length == 1)
                    ? const Radius.circular(12)
                    : post.images.length > 1 && index == 1
                        ? const Radius.circular(12)
                        : const Radius.circular(0),
              ),
              child: CachedNetworkImage(
                fadeInDuration: Duration.zero,
                cacheKey: post.images[index]['discordId'],
                imageUrl: post.images[index]['images'],
                fit: BoxFit.cover,
                errorWidget: (context, url, error) => Container(
                  color: Colors.black12,
                  child: const Center(child: Text("Image Cannot Displayed")),
                ),
                placeholder: (context, url) => const Skeletonizer(
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
              Text(post.likes.length.toString()),
              const SizedBox(width: 5),
              const Icon(Icons.comment),
              const SizedBox(width: 5),
              Text(post.comments.toString())
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                context.read<PostBloc>().add(PostEvent.likePost(post.id));
              },
              label: const Text(
                "Like",
                style: TextStyle(color: Colors.black),
              ),
              icon: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    postLiking: (id) {
                      if (id == post.id) {
                        return const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                color: Colors.black,
                                strokeAlign: BorderSide.strokeAlignCenter,
                                strokeWidth: 1));
                      }
                      return const Icon(Icons.thumb_up);
                    },
                    postLiked: (id) {
                      return const Icon(Icons.thumb_up);
                    },
                    orElse: () => const Icon(Icons.thumb_up),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.read<PostBloc>().add(PostEvent.showComments(post.id));
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
              onPressed: () {},
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
    );
  }
}
