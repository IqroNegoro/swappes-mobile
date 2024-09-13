import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/post_cubit.dart';
import 'package:swappes/providers/profile.dart';
import 'package:swappes/ui/shared_post.dart';

class EditPostUI extends StatefulWidget {
  final String id;
  const EditPostUI(this.id, {super.key});

  @override
  State<EditPostUI> createState() => _EditPostUIState();
}

class _EditPostUIState extends State<EditPostUI> {
  late PostCubit _cubit;

  List<dynamic> _oldImages = [];
  final List<File> _images = [];
  final picker = ImagePicker();
  TextEditingController description = TextEditingController();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _cubit = PostCubit()..getPost(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final status =
        context.select<PostCubit, PostStatus>((value) => value.state.status);

    return BlocConsumer<PostCubit, PostState>(
      bloc: _cubit,
      listener: (context, state) {
        log(state.status.toString());
        if (state.status == PostStatus.loaded) {
          if (state.post != null) {
            setState(() {
              description.text = state.post?.description ?? "";
              _oldImages =
                  state.post!.images.isEmpty ? [] : [...state.post!.images];
            });
          } else {
            context.pop();
          }
        }
      },
      builder: (context, state) {
        log(state.status.toString());
        return PopScope(
          canPop: status != PostStatus.editing,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Edit Post"),
              backgroundColor: const Color.fromARGB(255, 241, 241, 241),
              surfaceTintColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TextButton(
                    onPressed: status == PostStatus.editing
                        ? null
                        : () => context.read<PostCubit>().editPost(
                            id: widget.id,
                            description: description.text,
                            images: _images,
                            oldImages: _oldImages),
                    style: TextButton.styleFrom(
                        disabledBackgroundColor: Colors.black54,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 15)),
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    BlocListener<PostCubit, PostState>(
                      listener: (context, state) {
                        if (state.status == PostStatus.loaded) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            behavior: SnackBarBehavior.floating,
                            content: Text(
                              "Post Edited",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            showCloseIcon: true,
                            backgroundColor: Color(0xFF18191A),
                          ));
                          context.pop();
                        }
                      },
                      child: const SizedBox(),
                    ),
                    Consumer<Profile>(
                      builder: (BuildContext context, Profile value, _) {
                        return Row(
                          children: [
                            CachedNetworkImage(
                              imageUrl: value.avatar!.url ?? "",
                              imageBuilder: (context, imageProvider) =>
                                  CircleAvatar(
                                backgroundImage: imageProvider,
                              ),
                              errorWidget: (context, url, error) =>
                                  const CircleAvatar(
                                      backgroundColor: Colors.black12),
                              placeholder: (context, url) => const Skeletonizer(
                                effect: PulseEffect(),
                                child: Bone.circle(size: 2 * 20),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  value.name!,
                                  style: const TextStyle(
                                      letterSpacing: 0.5,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: description,
                      cursorColor: Colors.black,
                      maxLines: 15,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: "Write what your thinking...",
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                      ),
                    ),
                    ...state.post?.isShare == true
                        ? const []
                        : List.generate(
                            _oldImages.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _oldImages.removeAt(index);
                                });
                              },
                              child: Container(
                                width: double.infinity,
                                height: 200,
                                margin: const EdgeInsets.symmetric(vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                clipBehavior: Clip.hardEdge,
                                child: CachedNetworkImage(
                                  cacheKey: _oldImages[index]['discordId'],
                                  imageUrl: _oldImages[index]['images']!,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      Container(
                                    color: Colors.black12,
                                    child: const Center(
                                        child: Text("Image Cannot Displayed")),
                                  ),
                                  placeholder: (context, url) =>
                                      const Skeletonizer(
                                    effect: PulseEffect(),
                                    child: Bone.square(
                                      size: double.infinity,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                    ...state.post?.isShare == true
                        ? []
                        : List.generate(
                            _images.length,
                            (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  _images.removeAt(index);
                                });
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  clipBehavior: Clip.hardEdge,
                                  child: Image.file(
                                    _images[index],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                    state.post?.isShare == true
                        ? SharedPostUI(post: state.post!.share!)
                        : Visibility(
                            visible: !(_oldImages.length + _images.length >= 4),
                            child: Container(
                              width: double.infinity,
                              height: 200,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ElevatedButton(
                                onPressed: () => getImageFromGallery(),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.image,
                                      color: Colors.white,
                                    ),
                                    Text("Add Image",
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
