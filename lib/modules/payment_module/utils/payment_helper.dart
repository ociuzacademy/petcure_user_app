// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:petcure_user_app/modules/payment_module/enums/payment_method.dart';
import 'package:petcure_user_app/modules/payment_module/providers/payment_provider.dart';

import 'package:petcure_user_app/modules/payment_module/widgets/card_payment.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/u_p_i_payment.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:provider/provider.dart';

class PaymentHelper {
  final BuildContext context;
  final int? orderId;
  final int? appointmentId;
  final PaymentPurpose paymentPurpose;
  final String totalRate;
  const PaymentHelper({
    required this.context,
    this.orderId,
    this.appointmentId,
    required this.paymentPurpose,
    required this.totalRate,
  });

  // payment_provider.dart
  void makePayment(BuildContext context) {
    // Get the PaymentProvider instance before showing the bottom sheet
    final paymentProvider = Provider.of<PaymentProvider>(
      context,
      listen: false,
    );
    if (paymentProvider.selectedMethod == null) {
      CustomSnackBar.showError(
        context,
        message: 'Please select a payment method',
      );
      return;
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        // Provide the PaymentProvider to the bottom sheet content
        return ChangeNotifierProvider.value(
          value: paymentProvider,
          child: Builder(
            builder: (context) {
              switch (paymentProvider.selectedMethod!) {
                case PaymentMethod.upi:
                  return UPIPayment(
                    orderId: orderId,
                    appointmentId: appointmentId,
                    paymentPurpose: paymentPurpose,
                    totalRate: totalRate,
                  );
                case PaymentMethod.card:
                  return CardPayment(
                    orderId: orderId,
                    appointmentId: appointmentId,
                    paymentPurpose: paymentPurpose,
                    totalRate: totalRate,
                  );
              }
            },
          ),
        );
      },
    );
  }
}
