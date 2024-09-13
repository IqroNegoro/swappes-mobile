import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationSkeleton extends StatelessWidget {
  const NotificationSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Bone.circle(
              size: 70,
            ),
            const SizedBox(width: 15),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(BoneMock.name),
                      Text(BoneMock.paragraph),
                      Text(BoneMock.time)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
