import 'package:flutter/material.dart';
import "package:skeletonizer/skeletonizer.dart";

class PostSkeleton extends StatelessWidget {
  const PostSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: const PulseEffect(),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                const Bone.circle(
                  size: 40,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text(BoneMock.name), Text(BoneMock.fullName)],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Text(BoneMock.longParagraph),
          ),
          Bone.square(
            size: MediaQuery.sizeOf(context).width,
            borderRadius: BorderRadius.circular(12),
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Bone.iconButton(
                  size: 30,
                ),
                SizedBox(width: 5),
                Bone.text(
                  width: 30,
                ),
                SizedBox(width: 5),
                Bone.iconButton(
                  size: 30,
                ),
                SizedBox(width: 5),
                Bone.text(
                  width: 30,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Bone.iconButton(
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Bone.text(
                    width: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  Bone.iconButton(
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Bone.text(
                    width: 30,
                  ),
                ],
              ),
              Row(
                children: [
                  Bone.iconButton(
                    size: 30,
                  ),
                  SizedBox(width: 5),
                  Bone.text(
                    width: 30,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
