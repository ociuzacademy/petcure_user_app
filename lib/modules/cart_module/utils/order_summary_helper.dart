// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:petcure_user_app/core/models/cart_item.dart';

class OrderSummaryHelper {
  final List<CartItem> cartItems;
  const OrderSummaryHelper({required this.cartItems});

  // Calculate estimated delivery date (latest date among all items)
  DateTime get estimatedDeliveryDate {
    if (cartItems.isEmpty) return DateTime.now();
    return cartItems
        .map((item) => item.deliveryDate)
        .reduce((a, b) => a.isAfter(b) ? a : b);
  }

  // Format delivery date
  String formatDeliveryDate(DateTime date) {
    final today = DateTime.now();
    final tomorrow = DateTime.now().add(const Duration(days: 1));

    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      return 'Today';
    } else if (date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day) {
      return 'Tomorrow';
    } else {
      final months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      return '${months[date.month - 1]} ${date.day}';
    }
  }
}
