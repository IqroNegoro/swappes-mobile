import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/services/api.dart';
import 'package:swappes/storage/storage.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  Future<void> register(
      final String name, final String email, final String password) async {
    emit(const AuthState.loading());
    try {
      var login = await Api.dio.post("register",
          data: {"name": name, "email": email, "password": password});

      emit(const AuthState.success());
    } catch (error) {
      emit(AuthState.error(error));
      log(error.toString());
    }
  }

  Future<void> login(final String email, final String password) async {
    emit(const AuthState.loading());
    try {
      var login = await Api.dio
          .post("login", data: {"email": email, "password": password});
      await Storage.save("accessToken", login.data['accessToken']);
      await Storage.save("refreshToken", login.data['refreshToken']);

      emit(AuthState.success(user: login.data['user']));
    } catch (error) {
      emit(AuthState.error(error));
      log(error.toString());
    }
  }

  Future<void> checkAuthenticated() async {
    emit(const AuthState.loading());
    try {
      final check = await Api.dio.get("info");
      emit(AuthState.success(user: check.data));
    } catch (error) {
      emit(AuthState.error(error));
      log(error.toString());
    }
  }
}
