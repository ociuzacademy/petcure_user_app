// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/modules/payment_module/classes/u_p_i_data.dart';

class UPIPaymentHelper {
  const UPIPaymentHelper();

  static void upiPayment(BuildContext context, UPIData upiData) {
    final PaymentBloc paymentBloc = context.read<PaymentBloc>();
    paymentBloc.add(PaymentEvent.submittingUPIPayment(upiData));
  }
}
