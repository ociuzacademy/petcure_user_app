import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_history_module/models/pet_appointment_history_model.dart';
import 'package:petcure_user_app/modules/appointment_history_module/services/appointment_history_services.dart';

part 'appointment_history_state.dart';
part 'appointment_history_cubit.freezed.dart';

class AppointmentHistoryCubit extends Cubit<AppointmentHistoryState> {
  AppointmentHistoryCubit() : super(const AppointmentHistoryState.initial());

  Future<void> getAppointmentHistory({required int petId}) async {
    emit(const AppointmentHistoryState.loading());
    try {
      final response = await AppointmentHistoryServices.getAppointmentHistory(
        petId: petId,
      );
      emit(AppointmentHistoryState.success(petAppointmentHistory: response));
    } catch (e) {
      emit(AppointmentHistoryState.error(error: e.toString()));
    }
  }
}
