// ignore_for_file: public_member_api_docs, sort_constructors_first
// card_payment.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';
import 'package:petcure_user_app/modules/payment_module/providers/payment_provider.dart';
import 'package:petcure_user_app/modules/payment_module/utils/card_payment_helper.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/expiry_date_field.dart';
import 'package:petcure_user_app/modules/payment_module/widgets/payment_container.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class CardPayment extends StatelessWidget {
  final int orderId;
  final String totalRate;
  const CardPayment({
    super.key,
    required this.orderId,
    required this.totalRate,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PaymentProvider>(context, listen: false);

    return PaymentContainer(
      orderId: orderId,
      totalRate: totalRate,
      paymentForm: Form(
        key: provider.cardFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Card Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            NormalTextField(
              textEditingController: provider.cardNameController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the cardholder name';
                }
                return null;
              },
              labelText: 'Cardholder Name',
              hintText: "Enter cardholder's name",
              onChange: provider.formatCardName,
            ),
            const SizedBox(height: 16),
            NormalTextField(
              textEditingController: provider.cardNumberController,
              validatorFunction: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the card number';
                }
                if (value.length != 16) {
                  return 'Card number must have only 16 digits';
                }
                return null;
              },
              labelText: 'Card Number',
              hintText: "Enter card's number",
              textInputType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ExpiryDateField(
                    controller: provider.expiryDateController,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: provider.cvvController,
                    decoration: const InputDecoration(
                      labelText: 'CVV',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the CVV';
                      }
                      if (value.length != 3) {
                        return 'CVV must have only 3 digits';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            CustomButton(
              buttonWidth: double.infinity,
              backgroundColor: AppPalette.firstColor,
              textColor: Colors.white,
              labelText: 'Pay',
              onClick: () {
                final CardData? cardData = provider.validateCardPayment();

                if (cardData != null) {
                  Navigator.pop(context); // Close bottom sheet
                  CardPaymentHelper.cardPayment(context, cardData);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
