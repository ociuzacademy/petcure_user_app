// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/bloc/auth/auth_bloc.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class LoginHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginHelper({
    required this.context,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  void login() {
    FocusScope.of(context).unfocus();
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final AuthBloc authBloc = context.read<AuthBloc>();

      authBloc.add(AuthEvent.userLoggingIn(email, password));
    } else {
      CustomSnackBar.showError(
        context,
        message: "Please add both email and password.",
      );
    }
  }
}
