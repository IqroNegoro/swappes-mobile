part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.pending() = _Pending;
  const factory AuthState.error(final dynamic error) = _Error;
  const factory AuthState.authenticated({final dynamic user}) = _Authenticated;
}
