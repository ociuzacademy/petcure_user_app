// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/payment_module/widgets/card_payment.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/u_p_i_payment.dart';

class PaymentHelper {
  final BuildContext context;
  final ValueNotifier<String?> selectedMethod;
  final String orderId;
  final double totalRate;
  const PaymentHelper({
    required this.context,
    required this.selectedMethod,
    required this.orderId,
    required this.totalRate,
  });

  void makePayment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        switch (selectedMethod.value) {
          case 'UPI':
            return UPIPayment(orderId: orderId, amount: totalRate);
          default:
            return CardPayment(orderId: orderId, amount: totalRate);
        }
      },
    );
  }
}
