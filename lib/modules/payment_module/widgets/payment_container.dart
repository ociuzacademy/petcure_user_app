// payment_container.dart (remains the same)
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentContainer extends StatelessWidget {
  final Widget paymentForm;
  const PaymentContainer({super.key, required this.paymentForm});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(padding: EdgeInsets.all(16.w), child: paymentForm),
    );
  }
}
