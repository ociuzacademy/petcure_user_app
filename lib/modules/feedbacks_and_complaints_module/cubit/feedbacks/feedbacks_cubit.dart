import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/models/user_feedback_model.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/services/feedbacks_and_complaints_services.dart';

part 'feedbacks_state.dart';
part 'feedbacks_cubit.freezed.dart';

class FeedbacksCubit extends Cubit<FeedbacksState> {
  FeedbacksCubit() : super(const FeedbacksState.initial());

  Future<void> getUserFeedbacks() async {
    emit(const FeedbacksState.loading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      if (userId.isEmpty) {
        emit(const FeedbacksState.error('User ID is empty'));
        return;
      }

      final userFeedbacksModel =
          await FeedbacksAndComplaintsServices.getUserFeedbacks(userId: userId);
      emit(FeedbacksState.loaded(userFeedbacksModel));
    } catch (e) {
      emit(FeedbacksState.error(e.toString()));
    }
  }
}
