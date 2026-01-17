// ignore_for_file: public_member_api_docs, sort_constructors_first
// u_p_i_payment.dart
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';
import 'package:petcure_user_app/modules/payment_module/providers/payment_provider.dart';
import 'package:petcure_user_app/modules/payment_module/utils/u_p_i_payment_helper.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/payment_container.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class UPIPayment extends StatelessWidget {
  final int? orderId;
  final int? appointmentId;
  final PaymentPurpose paymentPurpose;
  final String totalRate;
  const UPIPayment({
    super.key,
    this.orderId,
    this.appointmentId,
    required this.paymentPurpose,
    required this.totalRate,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context, listen: false);

    return PaymentContainer(
      orderId: orderId,
      appointmentId: appointmentId,
      paymentPurpose: paymentPurpose,
      totalRate: totalRate,
      paymentForm: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'UPI',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Form(
            key: provider.upiFormKey,
            child: NormalTextField(
              textEditingController: provider.upiController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your UPI ID';
                }
                final RegExp regex = RegExp(
                  r'^[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}$',
                );
                if (!regex.hasMatch(value)) {
                  return 'Invalid UPI ID format';
                }
                return null;
              },
              labelText: 'UPI ID',
              hintText: 'example@upi',
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttonWidth: double.infinity,
            backgroundColor: AppPalette.firstColor,
            textColor: Colors.white,
            labelText: 'Pay',
            onClick: () {
              final UPIData? upiData = provider.validateUPIPayment();

              if (upiData != null) {
                Navigator.pop(context); // Close bottom sheet
                UPIPaymentHelper.upiPayment(context, upiData);
              }
            },
          ),
        ],
      ),
    );
  }
}
