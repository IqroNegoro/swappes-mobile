import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/friend.dart';
import 'package:swappes/services/api.dart';

part 'friend_state.dart';
part 'friend_cubit.freezed.dart';

class FriendCubit extends Cubit<FriendState> {
  FriendCubit() : super(const FriendState.initial());

  List<Friend> friends = [];

  Future<void> getFriends(
      {required String id, int limit = 20, int skip = 0}) async {
    emit(const FriendState.loading());
    try {
      final data = await Api.dio.get("users/$id/friends",
          queryParameters: {"limit": limit, "skip": skip});

      for (final friend in data.data['data']) {
        friends.add(Friend.fromJson(friend));
      }

      emit(FriendState.loaded(friends));
    } on DioException catch (error) {
      emit(FriendState.error(error.error));
    }
  }

  Future<void> deleteFriend({required String id}) async {
    emit(const FriendState.loading());
    try {
      final data = await Api.dio.delete("users/$id/friends");

      friends.removeWhere(
        (element) => element.user.id == id,
      );

      emit(FriendState.loaded(friends));
    } on DioException catch (error) {
      emit(FriendState.error(error.error));
    }
  }
}
