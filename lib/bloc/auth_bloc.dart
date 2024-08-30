import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/storage/storage.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.when(
        signIn: (email, password) async {
          emit(const AuthState.pending());
          try {
            var login = await Api.dio
                .post("login", data: {"email": email, "password": password});
            await Storage.save("accessToken", login.data['accessToken']);
            await Storage.save("refreshToken", login.data['refreshToken']);

            emit(const AuthState.authenticated());
          } catch (error) {
            emit(AuthState.error(error));
            log(error.toString());
          }
        },
        checkAuthenticated: () async {
          emit(const AuthState.pending());
          try {
            final check = await Api.dio.get("info");
            log(check.data.toString());
            emit(AuthState.authenticated(user: check.data));
          } catch (error) {
            emit(AuthState.error(error));
            log(error.toString());
          }
        },
        signOut: () {},
      );
    });
  }
}
