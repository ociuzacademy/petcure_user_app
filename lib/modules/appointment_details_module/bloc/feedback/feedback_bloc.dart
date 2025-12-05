import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/feedback_data.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/feedback_response_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/services/appointment_details_services.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';
part 'feedback_bloc.freezed.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(const FeedbackInitial()) {
    on<_SubmittingFeedback>(_onSubmittingFeedback);
  }

  Future<void> _onSubmittingFeedback(
    _SubmittingFeedback event,
    Emitter<FeedbackState> emit,
  ) async {
    emit(const FeedbackState.loading());
    try {
      final response = await AppointmentDetailsServices.submitFeedback(
        feedbackData: event.feedbackData,
      );
      emit(FeedbackState.success(response));
    } catch (e) {
      emit(FeedbackState.error(e.toString()));
    }
  }
}
