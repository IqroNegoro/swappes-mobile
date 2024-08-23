part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signIn(final String email, final String password) = _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
  const factory AuthEvent.checkAuthenticated() = _CheckAuthenticated;
}