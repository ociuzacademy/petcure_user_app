import 'package:petcure_user_app/modules/payment_module/classes/order_data.dart';

class CardData {
  final OrderData orderData;
  final String cardHolderName;
  final String cardNumber;
  final String expiryDate;
  final String cvvNumber;

  const CardData({
    required this.orderData,
    required this.cardHolderName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvvNumber,
  });
}
