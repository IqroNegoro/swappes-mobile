part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.error(final dynamic error) = _Error;
  const factory AuthState.success({final dynamic user}) = _Success;
  const factory AuthState.authenticated({final dynamic user}) = _Authenticated;
}
