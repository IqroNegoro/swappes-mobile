import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:swappes/models/services/api.dart';
import 'package:swappes/storage/storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignIn>((event, emit) async {
      emit(AuthPending());
      try {
        var login = await Api.dio.post("login",
            data: {"email": event.email, "password": event.password});
        await Storage.save("accessToken", login.data['accessToken']);
        await Storage.save("refreshToken", login.data['refreshToken']);

        emit(Authenticated());
      } catch (error) {
        emit(AuthError(error));
        log(error.toString());
      }
    });

    // on<SignOut>((event, emit) {});

    on<CheckAuthenticated>((event, emit) async {
      emit(AuthPending());
      try {
        final check = await Api.dio.get("info");
        log(check.data.toString());
        emit(Authenticated(user: check.data));
      } catch (error) {
        emit(AuthError(error));
        log(error.toString());
      }
    });
  }
}
