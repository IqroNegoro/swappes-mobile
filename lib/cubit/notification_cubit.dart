import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:swappes/models/notification.dart';
import 'package:swappes/services/api.dart';

part 'notification_state.dart';
part 'notification_cubit.freezed.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(const NotificationState.initial());

  List<NotificationModel> notifications = [];

  Future<void> getNotifications() async {
    emit(const NotificationState.loading());
    try {
      final data = await Api.dio.get("notifications");

      for (var notification in data.data['data']) {
        notifications.add(NotificationModel.fromJson(notification));
      }

      emit(NotificationState.loaded(notifications));
    } on DioException catch (error) {
      emit(NotificationState.error(error.error));
    }
  }
}
