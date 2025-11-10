part of 'edit_user_profile_bloc.dart';

@freezed
sealed class EditUserProfileState with _$EditUserProfileState {
  const factory EditUserProfileState.initial() = EditUserProfileInitial;
  const factory EditUserProfileState.editUserProfileLoading() =
      EditUserProfileLoading;
  const factory EditUserProfileState.editUserProfileError(String errorMessage) =
      EditUserProfileError;
  const factory EditUserProfileState.updateUserProfileSuccess(
    UpdateUserProfileResponseModel response,
  ) = UpdateUserProfileSuccess;
}
