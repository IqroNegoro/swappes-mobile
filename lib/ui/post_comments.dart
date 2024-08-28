import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/ui/comment.dart';

class PostCommentsUI extends StatelessWidget {
  final String id;
  const PostCommentsUI(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 0.5,
      maxChildSize: 1,
      snap: true,
      shouldCloseOnMinExtent: true,
      builder: (_, scrollController) => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Comments",
                style: TextStyle(fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();

                  return true;
                },
                child: BlocBuilder<PostCubit, PostState>(
                  bloc: PostCubit()..showComments(id),
                  builder: (context, state) {
                    return ListView(
                      controller: scrollController,
                      children: const [
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                        CommentUI(),
                      ],
                    );
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
