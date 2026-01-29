import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/models/user_complaints_model.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/services/feedbacks_and_complaints_services.dart';

part 'complaints_state.dart';
part 'complaints_cubit.freezed.dart';

class ComplaintsCubit extends Cubit<ComplaintsState> {
  ComplaintsCubit() : super(const ComplaintsState.initial());

  Future<void> getUserComplaints() async {
    emit(const ComplaintsState.loading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      if (userId.isEmpty) {
        emit(const ComplaintsState.error('User ID is empty'));
        return;
      }
      final userComplaintsModel =
          await FeedbacksAndComplaintsServices.getUserComplaints(
            userId: userId,
          );
      emit(ComplaintsState.loaded(userComplaintsModel));
    } catch (e) {
      emit(ComplaintsState.error(e.toString()));
    }
  }
}
