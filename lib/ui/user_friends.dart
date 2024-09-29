import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swappes/cubit/friend_cubit.dart';
import 'package:swappes/providers/profile.dart';

class UserFriendsUI extends StatefulWidget {
  final String id;
  final String name;
  const UserFriendsUI(this.id, this.name, {super.key});

  @override
  State<UserFriendsUI> createState() => UserFriendsUIState();
}

class UserFriendsUIState extends State<UserFriendsUI> {
  late FriendCubit _cubit;
  late FriendCubit _getFriends;

  @override
  void initState() {
    super.initState();
    _cubit = FriendCubit();
    _getFriends = _cubit..getFriends(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
      body: DraggableScrollableSheet(
        initialChildSize: 1,
        minChildSize: 0.8,
        maxChildSize: 1,
        snap: true,
        builder: (_, scrollController) => Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Friends of ${widget.name}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              Expanded(
                  child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (notification) {
                  notification.disallowIndicator();

                  return true;
                },
                child: BlocConsumer<FriendCubit, FriendState>(
                  bloc: _getFriends,
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  buildWhen: (previous, current) => previous.maybeWhen(
                      loaded: (_) => false, orElse: () => true),
                  builder: (context, state) {
                    log(state.maybeWhen(
                        orElse: () => "",
                        loaded: (friends) => friends.toString(),
                        error: (errors) => errors.toString()));
                    return ListView(
                        controller: scrollController,
                        children: state.maybeWhen(
                            loaded: (friends) => friends.isEmpty
                                ? [
                                    const Center(
                                      child: Text(
                                          "There is no friends, be the first one"),
                                    )
                                  ]
                                : friends
                                    .map(
                                      (element) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            ElevatedButton(
                                              onPressed: () => context
                                                  .pushNamed("UserId",
                                                      pathParameters: {
                                                    "id": element.user.id
                                                  }),
                                              style: ElevatedButton.styleFrom(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  minimumSize: const Size(0, 0),
                                                  backgroundColor:
                                                      Colors.transparent),
                                              child: CachedNetworkImage(
                                                width: 75,
                                                height: 75,
                                                imageUrl: element
                                                        .user.avatar['url'] ??
                                                    "",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        CircleAvatar(
                                                  backgroundImage:
                                                      imageProvider,
                                                ),
                                                errorWidget: (_, __, ___) =>
                                                    const CircleAvatar(
                                                  backgroundImage: AssetImage(
                                                    ("assets/images/default_profile.png"),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    const Skeletonizer(
                                                  effect: PulseEffect(),
                                                  child:
                                                      Bone.circle(size: 2 * 20),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            SizedBox(
                                              height: 15,
                                              child: TextButton(
                                                onPressed: () => context
                                                    .pushNamed("UserId",
                                                        pathParameters: {
                                                      "id": element.user.id
                                                    }),
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            0)),
                                                child: Text(
                                                  element.user.name,
                                                  style: const TextStyle(
                                                      letterSpacing: 0.5,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ),
                                            const Spacer(),
                                            Consumer<Profile>(
                                              builder: (__, value, _) =>
                                                  value.id == widget.id
                                                      ? ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                              shape: const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              2))),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              backgroundColor:
                                                                  Colors.red
                                                                      .shade600),
                                                          onPressed: () {
                                                            showModalBottomSheet(
                                                              context: context,
                                                              builder:
                                                                  (context) =>
                                                                      Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(
                                                                        25.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                        textAlign:
                                                                            TextAlign
                                                                                .center,
                                                                        "Are you sure to unfriend with ${element.user.name}?",
                                                                        style: const TextStyle(
                                                                            fontSize:
                                                                                24)),
                                                                    const SizedBox(
                                                                        height:
                                                                            30),
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        TextButton(
                                                                            style:
                                                                                TextButton.styleFrom(backgroundColor: Colors.black87),
                                                                            onPressed: () {
                                                                              context.pop();
                                                                            },
                                                                            child: const Text(style: TextStyle(color: Colors.white), "Cancel")),
                                                                        const SizedBox(
                                                                            width:
                                                                                20),
                                                                        TextButton(
                                                                            style:
                                                                                TextButton.styleFrom(backgroundColor: Colors.red.shade600),
                                                                            onPressed: () {
                                                                              _cubit.deleteFriend(id: element.user.id);
                                                                            },
                                                                            child: const Text(style: TextStyle(color: Colors.white), "Unfriend"))
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: const Icon(
                                                            Icons
                                                                .delete_outline,
                                                            color: Colors.white,
                                                          ),
                                                        )
                                                      : const SizedBox(),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                            loading: () => List.generate(
                                  10,
                                  (index) => Skeletonizer(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10.0),
                                      child: Row(
                                        children: [
                                          const Bone.circle(
                                            size: 70,
                                          ),
                                          const SizedBox(width: 15),
                                          Flexible(
                                              child: Text(BoneMock.fullName)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            error: (errors) => [
                                  Center(
                                      child: Column(children: [
                                    const Text("Something wrong, try again"),
                                    const SizedBox(height: 15),
                                    TextButton(
                                      child: const Text("Refresh",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      onPressed: () =>
                                          _cubit.getFriends(id: widget.id),
                                    )
                                  ]))
                                ],
                            orElse: () => [const Text("apalah bjir")]));
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
