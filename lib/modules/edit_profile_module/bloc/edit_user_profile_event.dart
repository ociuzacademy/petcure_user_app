part of 'edit_user_profile_bloc.dart';

@freezed
sealed class EditUserProfileEvent with _$EditUserProfileEvent {
  const factory EditUserProfileEvent.started() = _Started;
  const factory EditUserProfileEvent.updatingUserProfile(
    EditProfileData updatedUserProfileData,
  ) = _UpdatingUserProfile;
}
