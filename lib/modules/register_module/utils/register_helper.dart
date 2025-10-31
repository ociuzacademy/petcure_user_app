// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:petcure_user_app/modules/register_module/bloc/register_bloc.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';

class RegisterHelper {
  final BuildContext context;

  const RegisterHelper({required this.context});

  void register(UserRegisterDetails userDetails) {
    FocusScope.of(context).unfocus();
    final RegisterBloc registerBloc = context.read<RegisterBloc>();
    registerBloc.add(RegisterEvent.userRegistering(userDetails));
  }
}
