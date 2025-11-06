import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class UPIPaymentHelper {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final double amount;

  const UPIPaymentHelper({
    required this.context,
    required this.formKey,
    required this.amount,
  });

  void upiPayement() {
    if (formKey.currentState!.validate()) {
      CustomSnackBar.showSuccess(
        context,
        message: 'UPI payment completed successfully.',
      );
      Navigator.pop(context); // close bottom sheet
      Navigator.pushAndRemoveUntil(context, HomePage.route(), (route) => false);
    } else {
      CustomSnackBar.showError(context, message: 'Please fill UPI ID.');
    }
  }
}
