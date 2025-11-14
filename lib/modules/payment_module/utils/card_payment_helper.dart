// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/modules/payment_module/classes/card_data.dart';

class CardPaymentHelper {
  const CardPaymentHelper();

  static void cardPayment(BuildContext context, CardData cardData) {
    final PaymentBloc paymentBloc = context.read<PaymentBloc>();
    paymentBloc.add(PaymentEvent.submittingCardPayment(cardData));
  }
}
