// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/payment_module/widgets/card_payment.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/u_p_i_payment.dart';

class PaymentHelper {
  final BuildContext context;
  final ValueNotifier<String?> selectedMethod;
  final String bookingId;
  final double totalRate;
  const PaymentHelper({
    required this.context,
    required this.selectedMethod,
    required this.bookingId,
    required this.totalRate,
  });

  void makePayment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        switch (selectedMethod.value) {
          case "UPI":
            return UPIPayment(bookingId: bookingId, amount: totalRate);
          default:
            return CardPayment(bookingId: bookingId, amount: totalRate);
        }
      },
    );
  }
}
