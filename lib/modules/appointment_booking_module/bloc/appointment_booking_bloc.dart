import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/classes/appointment_booking_data.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/appointment_booking_response_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/services/appointment_booking_services.dart';

part 'appointment_booking_event.dart';
part 'appointment_booking_state.dart';
part 'appointment_booking_bloc.freezed.dart';

class AppointmentBookingBloc
    extends Bloc<AppointmentBookingEvent, AppointmentBookingState> {
  AppointmentBookingBloc() : super(const AppointmentBookingInitial()) {
    on<_BookingAppointment>(_onBookingAppointment);
  }

  Future<void> _onBookingAppointment(
    _BookingAppointment event,
    Emitter<AppointmentBookingState> emit,
  ) async {
    emit(const AppointmentBookingLoading());
    try {
      final AppointmentBookingResponseModel response =
          await AppointmentBookingServices.bookAppointment(
            appointmentBookingData: event.data,
          );
      emit(AppointmentBookingSuccess(response));
    } catch (e) {
      emit(AppointmentBookingError(e.toString()));
    }
  }
}
