import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:swappes/cubit/comment_cubit.dart';
import 'package:swappes/models/comment.dart';
import 'package:swappes/ui/comment.dart';
import 'package:swappes/ui/comment_skeleton.dart';

class PostCommentsUI extends StatefulWidget {
  final String id;
  const PostCommentsUI(this.id, {super.key});

  @override
  State<PostCommentsUI> createState() => _PostCommentsUIState();
}

class _PostCommentsUIState extends State<PostCommentsUI> {
  final TextEditingController _comment = TextEditingController();
  late CommentCubit _cubit;
  late CommentCubit _getComments;
  File? _image;
  final picker = ImagePicker();

  CommentModel? replying;

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _cubit = CommentCubit();
    _getComments = _cubit..getComments(widget.id);
  }

  void replyComment(CommentModel comment) {
    setState(() {
      replying =
          replying != null && replying!.id == comment.id ? null : comment;
    });
  }

  void handleDelete(String commentId, String? replyId) =>
      _cubit.deleteComment(commentId, widget.id, replyId);

  void handleReply() =>
      _cubit.replyComment(widget.id, _comment.text, _image, replying!.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      bottomSheet: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0, left: 15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            replying != null
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Replying to ${replying!.user.name}, "),
                      GestureDetector(
                        onTap: () => setState(() {
                          replying = null;
                        }),
                        child: const Text("Cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black)),
                      )
                    ],
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: TextField(
                    controller: _comment,
                    decoration: InputDecoration(
                      hintText:
                          "Write what your ${replying != null ? 'reply' : 'comment'}...",
                      hintStyle: const TextStyle(fontSize: 14),
                      filled: true,
                      fillColor: Colors.black12,
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 15),
                      border:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                _image != null
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            _image = null;
                          });
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        width: 48,
                        height: 48,
                        color: Colors.black12,
                        child: IconButton(
                          onPressed: () => getImageFromGallery(),
                          icon: const Icon(Icons.image),
                        ),
                      ),
                BlocBuilder<CommentCubit, CommentState>(
                  bloc: _cubit,
                  builder: (context, state) => IconButton(
                      style: IconButton.styleFrom(
                          disabledForegroundColor: Colors.black12),
                      onPressed: state.maybeWhen(
                          orElse: () => () {
                                replying != null
                                    ? handleReply()
                                    : _cubit.postComment(
                                        widget.id, _comment.text, _image);
                              },
                          postComment: (_) => null),
                      icon: const Icon(Icons.send)),
                )
              ],
            ),
          ],
        ),
      ),
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.8,
        maxChildSize: 1,
        snap: true,
        builder: (_, scrollController) => Container(
          padding: const EdgeInsets.only(bottom: 60),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Comments",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();

                  return true;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BlocConsumer<CommentCubit, CommentState>(
                    bloc: _getComments,
                    listenWhen: (previous, current) => current.maybeWhen(
                        orElse: () => true, deleteComment: (_) => false),
                    listener: (context, state) {
                      state.maybeWhen(
                          loaded: (_) {
                            setState(() {
                              _comment.text = "";
                              _image = null;
                            });
                          },
                          orElse: () {});
                    },
                    buildWhen: (previous, current) {
                      return previous.maybeWhen(
                              orElse: () => true,
                              deleteComment: (_) => false) &&
                          current.maybeWhen(
                              orElse: () => true,
                              postComment: (_) => false,
                              deleteComment: (_) => false);
                    },
                    builder: (context, state) {
                      return state.maybeWhen(
                          orElse: () => ListView(
                              children: List.generate(
                                  5, (_) => const CommentSkeleton())),
                          loaded: (comments) => comments.isEmpty
                              ? const Center(
                                  child: Text(
                                      "There is no comments in this post, be the first"),
                                )
                              : ListView(
                                  controller: scrollController,
                                  children: List.generate(
                                      comments.length,
                                      (index) => CommentUI(comments[index],
                                          handleDelete, replyComment))),
                          error: (_) => Center(
                                  child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("Error when load comment",
                                      style: TextStyle(fontSize: 20)),
                                  const SizedBox(height: 20),
                                  TextButton(
                                      onPressed: () =>
                                          _cubit.getComments(widget.id),
                                      child: const Text("Try Again",
                                          style:
                                              TextStyle(color: Colors.white)))
                                ],
                              )));
                    },
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
