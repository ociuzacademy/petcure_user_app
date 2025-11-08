// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/cubit/user_profile/user_profile_cubit.dart';

class UserProfileHelper {
  final BuildContext context;
  const UserProfileHelper({required this.context});

  void userProfileDataInit() {
    final UserProfileCubit userProfileCubit = context.read<UserProfileCubit>();
    userProfileCubit.getUserProfileData();
  }
}
