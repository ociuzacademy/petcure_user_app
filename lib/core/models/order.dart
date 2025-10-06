// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_user_app/core/models/cart_item.dart';

enum OrderDeliveryStatus {
  orderPlaced,
  orderOnTheWay,
  orderDelivered,
  orderCancelled,
}

class Order {
  final String orderId;
  final String userId;
  final DateTime orderDate;
  final List<CartItem> productsOrdered;
  final double totalRate;
  final OrderDeliveryStatus orderDeliveryStatus;
  final DateTime estimatedDeliveryDate;
  const Order({
    required this.orderId,
    required this.userId,
    required this.orderDate,
    required this.productsOrdered,
    required this.totalRate,
    required this.orderDeliveryStatus,
    required this.estimatedDeliveryDate,
  });
}
