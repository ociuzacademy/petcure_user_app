// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class CardPaymentHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  const CardPaymentHelper({required this.context, required this.formKey});

  void cardPayment() {
    if (formKey.currentState!.validate()) {
      CustomSnackBar.showSuccess(
        context,
        message: 'Card payment completed successfully.',
      );
      Navigator.pop(context); // close bottom sheet
      Navigator.pushAndRemoveUntil(context, HomePage.route(), (route) => false);
    } else {
      CustomSnackBar.showError(
        context,
        message: 'Please fill all card details',
      );
    }
  }
}
