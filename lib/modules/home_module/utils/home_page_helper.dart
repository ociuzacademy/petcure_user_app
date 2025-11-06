// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/bloc/auth/auth_bloc.dart';

import 'package:petcure_user_app/widgets/dialog_box/custom_dialog_box.dart';

class HomePageHelper {
  final BuildContext context;
  const HomePageHelper({required this.context});

  void showLogoutDialog() {
    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Logout',
      message: 'Do you wanted to logout from the app?',
      onSubmit: () {
        final AuthBloc authBloc = context.read<AuthBloc>();
        authBloc.add(const AuthEvent.userLoggingOut());
      },
    );
  }
}
