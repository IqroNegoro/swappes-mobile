import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentSkeleton extends StatelessWidget {
  const CommentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const PulseEffect(),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bone.circle(
              size: 40,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(BoneMock.name), Text(BoneMock.paragraph)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
