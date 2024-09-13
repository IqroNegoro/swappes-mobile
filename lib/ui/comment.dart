
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/models/comment.dart';
import 'package:swappes/providers/profile.dart';

class CommentUI extends StatefulWidget {
  final CommentModel comment;
  final Function(String commentId) handleDelete;
  final Function(CommentModel comment) replyComment;

  const CommentUI(this.comment, this.handleDelete, this.replyComment,
      {super.key});

  @override
  State<CommentUI> createState() => _CommentUIState();
}

class _CommentUIState extends State<CommentUI> {
  bool isReadMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: widget.comment.replyId != null ? 15 : 0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: widget.comment.user.avatar.url ?? "",
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
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(2)),
                        color: Colors.black12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.comment.user.name,
                          style: const TextStyle(
                              letterSpacing: 0.5, fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () => setState(() => isReadMore = !isReadMore),
                          child: Text(
                            widget.comment.comment ?? "",
                            maxLines: isReadMore ? 1000 : 7,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widget.comment.image != null ? 5 : 0),
                  widget.comment.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          clipBehavior: Clip.hardEdge,
                          child: CachedNetworkImage(
                            width: 200,
                            height: 200,
                            cacheKey: widget.comment.image['discordId'],
                            imageUrl: widget.comment.image['image'],
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) => Container(
                              color: Colors.black12,
                              child: const Center(
                                  child: Text("Image Cannot Displayed")),
                            ),
                            placeholder: (context, url) => const Skeletonizer(
                              effect: PulseEffect(),
                              child: Bone.square(
                                size: double.infinity,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(0),
                            backgroundColor: Colors.transparent,
                          ),
                          child: const Text("Reply",
                              style:
                                  TextStyle(color: Color.fromRGBO(0, 0, 0, 1))),
                          onPressed: () => widget.replyComment(widget.comment),
                        ),
                        const SizedBox(width: 10),
                        Consumer<Profile>(
                          builder: (_, value, child) =>
                              value.id == widget.comment.user.id
                                  ? child!
                                  : const SizedBox(),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              backgroundColor: Colors.transparent,
                            ),
                            child: const Text("Delete",
                                style: TextStyle(color: Colors.black)),
                            onPressed: () =>
                                widget.handleDelete(widget.comment.id),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.comment.reply.isNotEmpty
                      ? Column(
                          children: List.generate(
                              widget.comment.reply.length,
                              (index) => CommentUI(widget.comment.reply[index],
                                  widget.handleDelete, widget.replyComment)),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
