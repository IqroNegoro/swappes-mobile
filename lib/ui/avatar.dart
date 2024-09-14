import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/models/avatar.dart';

class AvatarUI extends StatelessWidget {
  final Avatar avatar;
  final double? width;
  final double? height;
  final BoxFit fit;
  const AvatarUI(
      {required this.avatar,
      this.width,
      this.height,
      this.fit = BoxFit.cover,
      super.key});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      cacheKey: avatar.url,
      imageUrl: avatar.url ?? "",
      imageBuilder: (_, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      errorWidget: (_, __, ___) => const CircleAvatar(
        backgroundImage: AssetImage(
          ("assets/images/default_profile.png"),
        ),
      ),
      fit: fit,
      placeholder: (_, __) => const Skeletonizer(
        effect: PulseEffect(),
        child: Bone.circle(size: 2 * 20),
      ),
    );
  }
}
