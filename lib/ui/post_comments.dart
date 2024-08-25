import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:swappes/bloc/post_bloc.dart';
import 'package:swappes/models/post.dart';

class PostCommentsUI extends StatelessWidget {
  final String id;
  const PostCommentsUI(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(id),
      direction: DismissDirection.down,
      onDismissed: (_) {
        context.read<PostBloc>().add(PostEvent.showComments(id));
      },
      child: const Scaffold(
        backgroundColor: Color.fromARGB(255, 241, 241, 241),
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Comments",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
