part of 'friend_cubit.dart';

@freezed
class FriendState with _$FriendState {
  const factory FriendState.initial() = _Initial;
  const factory FriendState.loading() = _Loading;
  const factory FriendState.loaded(List<Friend> friends) = _Loaded;
  const factory FriendState.error(dynamic errors) = _Error;
}
