import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/cancel_appointment_response_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/services/appointment_details_services.dart';

part 'cancel_appointment_event.dart';
part 'cancel_appointment_state.dart';
part 'cancel_appointment_bloc.freezed.dart';

class CancelAppointmentBloc
    extends Bloc<CancelAppointmentEvent, CancelAppointmentState> {
  CancelAppointmentBloc() : super(const CancelAppointmentInitial()) {
    on<_CancelAppointment>(_onCancelAppointment);
  }

  Future<void> _onCancelAppointment(
    _CancelAppointment event,
    Emitter<CancelAppointmentState> emit,
  ) async {
    emit(const CancelAppointmentLoading());
    try {
      final response = await AppointmentDetailsServices.cancelAppointment(
        bookingId: event.bookingId,
      );
      emit(CancelAppointmentSuccess(response));
    } catch (e) {
      emit(CancelAppointmentError(e.toString()));
    }
  }
}
