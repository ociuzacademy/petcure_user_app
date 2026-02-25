// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_user_app/modules/register_module/bloc/register_bloc.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';
import 'package:petcure_user_app/modules/register_module/providers/register_form_provider.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class RegisterHelper {
  final BuildContext context;

  const RegisterHelper({required this.context});

  void register(RegisterFormProvider registerFormProvider) {
    FocusScope.of(context).unfocus();
    final UserRegisterDetails? userRegisterDetails = registerFormProvider
        .validateForm(context);

    if (userRegisterDetails != null) {
      final RegisterBloc registerBloc = context.read<RegisterBloc>();
      registerBloc.add(RegisterEvent.userRegistering(userRegisterDetails));
    } else {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
    }
  }
}
