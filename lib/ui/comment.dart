import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentUI extends StatelessWidget {
  const CommentUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
          imageUrl: "",
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
        const Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Iqro Negoro",
                style:
                    TextStyle(letterSpacing: 0.5, fontWeight: FontWeight.w600),
              ),
              Text(
                "Test",
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ],
    );
  }
}
