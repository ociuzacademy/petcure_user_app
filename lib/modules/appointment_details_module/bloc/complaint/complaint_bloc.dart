import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/complaint_data.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/complaint_response_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/services/appointment_details_services.dart';

part 'complaint_event.dart';
part 'complaint_state.dart';
part 'complaint_bloc.freezed.dart';

class ComplaintBloc extends Bloc<ComplaintEvent, ComplaintState> {
  ComplaintBloc() : super(const ComplaintInitial()) {
    on<_SubmittingComplaint>(_onSubmittingComplaint);
  }

  Future<void> _onSubmittingComplaint(
    _SubmittingComplaint event,
    Emitter<ComplaintState> emit,
  ) async {
    emit(const ComplaintState.loading());
    try {
      final response = await AppointmentDetailsServices.submitComplaint(
        complaintData: event.complaintData,
      );
      emit(ComplaintState.success(response));
    } catch (e) {
      emit(ComplaintState.error(e.toString()));
    }
  }
}
