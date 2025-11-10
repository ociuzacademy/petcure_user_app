import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/edit_profile_module/classes/edit_profile_data.dart';
import 'package:petcure_user_app/modules/edit_profile_module/model/update_user_profile_response_model.dart';
import 'package:petcure_user_app/modules/edit_profile_module/services/edit_profile_services.dart';

part 'edit_user_profile_event.dart';
part 'edit_user_profile_state.dart';
part 'edit_user_profile_bloc.freezed.dart';

class EditUserProfileBloc
    extends Bloc<EditUserProfileEvent, EditUserProfileState> {
  EditUserProfileBloc() : super(const EditUserProfileInitial()) {
    on<_UpdatingUserProfile>(_onUpdatingUserProfile);
  }

  Future<void> _onUpdatingUserProfile(
    _UpdatingUserProfile event,
    Emitter<EditUserProfileState> emit,
  ) async {
    emit(const EditUserProfileState.editUserProfileLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final UpdateUserProfileResponseModel response =
          await EditProfileServices.registerUser(
            userId: userId,
            updatedProfileData: event.updatedUserProfileData,
          );

      emit(EditUserProfileState.updateUserProfileSuccess(response));
    } catch (e) {
      emit(EditUserProfileState.editUserProfileError(e.toString()));
    }
  }
}
