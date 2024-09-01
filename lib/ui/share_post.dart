import "dart:developer";
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/providers/profile.dart';

class SharePostUI extends StatefulWidget {
  final String postId;
  const SharePostUI(this.postId, {super.key});

  @override
  State<SharePostUI> createState() => _SharePostUIState();
}

class _SharePostUIState extends State<SharePostUI> {
  late TextEditingController description;

  @override
  void initState() {
    super.initState();
    description = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final Profile user = context.read<Profile>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      width: double.infinity,
      child: Column(
        children: [
          const Text("Share Post",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: user.avatar?.url ?? "",
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
                  Text(
                    user.name!,
                    style: const TextStyle(
                        letterSpacing: 0.5, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                controller: description,
                cursorColor: Colors.black,
                maxLines: 10,
                decoration: const InputDecoration(
                  hintText: "Write what your think about this post...",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
            ],
          ),
          const Spacer(flex: 1),
          BlocConsumer<PostCubit, PostState>(
            listener: (_, state) {
              if (state.status == PostStatus.loaded) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  behavior: SnackBarBehavior.floating,
                  content: Text(
                    "Post Shared",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  showCloseIcon: true,
                  backgroundColor: Color(0xFF18191A),
                ));
                context.pop();
              }
            },
            builder: (_, state) {
              return Align(
                  alignment: const Alignment(1, 1),
                  child: TextButton(
                      onPressed: state.status == PostStatus.sharing
                          ? null
                          : () => context
                              .read<PostCubit>()
                              .sharePost(widget.postId, description.text),
                      child: const Text("Share",
                          style: TextStyle(color: Colors.white))));
            },
          )
        ],
      ),
    );
  }
}
