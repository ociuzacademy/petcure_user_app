import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/services/appointment_details_services.dart';

part 'appointment_details_state.dart';
part 'appointment_details_cubit.freezed.dart';

class AppointmentDetailsCubit extends Cubit<AppointmentDetailsState> {
  AppointmentDetailsCubit() : super(const AppointmentDetailsState.initial());

  Future<void> getAppointmentDetails(int bookingId) async {
    emit(const AppointmentDetailsState.loading());
    try {
      final response = await AppointmentDetailsServices.getAppointmentDetails(
        bookingId: bookingId,
      );
      emit(AppointmentDetailsState.success(response));
    } catch (e) {
      emit(AppointmentDetailsState.error(e.toString()));
    }
  }
}
