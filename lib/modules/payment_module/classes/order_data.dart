import 'package:petcure_user_app/core/enums/payment_purpose.dart';

class OrderData {
  final int? orderId;
  final int? appointmentId;
  final PaymentPurpose paymentPurpose;
  final String amount;

  const OrderData({
    this.orderId,
    this.appointmentId,
    required this.paymentPurpose,
    required this.amount,
  });
}
