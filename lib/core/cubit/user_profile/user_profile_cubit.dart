import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/core/models/api_models/user_profile_model.dart';
import 'package:petcure_user_app/core/services/pet_services.dart';

part 'user_profile_state.dart';
part 'user_profile_cubit.freezed.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit() : super(const UserProfileState.initial());

  Future<void> getUserProfileData() async {
    emit(const UserProfileState.userProfileLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final UserProfileModel userProfileData =
          await PetServices.getUserProfileData(userId: userId);

      emit(UserProfileState.userPrfoileDataSuccess(userProfileData));
    } catch (e) {
      emit(UserProfileState.userProfileError(e.toString()));
    }
  }
}
