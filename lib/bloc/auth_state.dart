part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthPending extends AuthState {}

final class AuthError extends AuthState {
  final dynamic error;

  AuthError(this.error);
}

final class Authenticated extends AuthState {
  final dynamic user;

  Authenticated({this.user});
}