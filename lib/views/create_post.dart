import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/bloc/post_bloc.dart';
import 'package:swappes/providers/profile.dart';

class CreatePostUI extends StatefulWidget {
  const CreatePostUI({super.key});

  @override
  State<CreatePostUI> createState() => _CreatePostUIState();
}

class _CreatePostUIState extends State<CreatePostUI> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Create Post"),
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        surfaceTintColor: Colors.transparent,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextButton(
              style: TextButton.styleFrom(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 15)
                  // maximumSize: Size(100, 30),
                  ),
              onPressed: () async {
                context.read<PostBloc>().add(CreatePost());
              },
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is CreatingPost) {
                    return const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    );
                  } else if (state is PostCreated) {
                    context.goNamed("MainPage");
                  }
                  return SizedBox(
                    width: 30,
                    height: 30,
                    child: const Text(
                      "Post",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
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
              Consumer<Profile>(
                builder: (BuildContext context, Profile value, _) {
                  return Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: value.avatar!.url ?? "",
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
              SizedBox(
                height: 30,
              ),
              TextField(
                controller: description,
                cursorColor: Colors.black,
                maxLines: 15,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: "Write your thinking...",
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
              ),
              ...List.generate(
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
                      margin: const EdgeInsets.symmetric(vertical: 8),
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
              Visibility(
                visible: _images.length != 4,
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
                    child: const Center(
                      child: Icon(
                        Icons.image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
