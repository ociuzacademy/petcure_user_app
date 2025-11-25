// ignore_for_file: public_member_api_docs, sort_constructors_first
// payment_container.dart (remains the same)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/payment_module/providers/payment_provider.dart';

class PaymentContainer extends StatelessWidget {
  final int orderId;
  final String totalRate;
  final Widget paymentForm;
  const PaymentContainer({
    super.key,
    required this.orderId,
    required this.totalRate,
    required this.paymentForm,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          PaymentProvider(orderId: orderId, totalRate: totalRate),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(padding: EdgeInsets.all(16.w), child: paymentForm),
      ),
    );
  }
}
