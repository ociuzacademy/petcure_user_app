// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/edit_profile_module/classes/edit_profile_data.dart';

class EditProfileHelper {
  final BuildContext context;
  const EditProfileHelper({required this.context});

  void userProfileDataInit() {
    final UserProfileCubit userProfileCubit = context.read<UserProfileCubit>();
    userProfileCubit.getUserProfileData();
  }

  void editProfile(EditProfileData editedProfileData) {
    FocusScope.of(context).unfocus();
    final EditUserProfileBloc editUserProfileBloc = context
        .read<EditUserProfileBloc>();
    editUserProfileBloc.add(
      EditUserProfileEvent.updatingUserProfile(editedProfileData),
    );
  }
}
