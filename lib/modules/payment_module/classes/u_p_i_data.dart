import 'package:petcure_user_app/modules/payment_module/classes/order_data.dart';

class UPIData {
  final OrderData orderData;
  final String upiId;

  const UPIData({required this.orderData, required this.upiId});
}
