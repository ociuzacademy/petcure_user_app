// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/typedefs/format_date.dart';
import 'package:petcure_user_app/core/typedefs/order_delivery_status_color.dart';
import 'package:petcure_user_app/modules/order_details_module/view/order_details_page.dart';
import 'package:petcure_user_app/modules/orders_list_module/enums/user_order_delivery_status.dart';
import 'package:petcure_user_app/modules/orders_list_module/models/user_order_list_model.dart';
import 'package:petcure_user_app/modules/orders_list_module/typedefs/order_delivery_status_icon.dart';
import 'package:petcure_user_app/modules/orders_list_module/typedefs/order_delivery_status_text.dart';
import 'package:petcure_user_app/modules/orders_list_module/typedefs/product_names.dart';

class OrderListCard extends StatelessWidget {
  const OrderListCard({
    super.key,
    required this.order,
    required this.getStatusText,
    required this.getStatusColor,
    required this.getStatusIcon,
    required this.formatDate,
    required this.formatDeliveryDate,
    required this.getProductNames,
  });

  final UserOrderListModel order;
  final OrderDeliveryStatusText getStatusText;
  final OrderDeliveryStatusColor getStatusColor;
  final OrderDeliveryStatusIcon getStatusIcon;
  final FormatDate formatDate;
  final FormatDate formatDeliveryDate;
  final ProductNames getProductNames;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 1,
      child: InkWell(
        onTap: () =>
            Navigator.push(context, OrderDetailsPage.route(orderId: order.id)),
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Order ID and Status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Order #${order.id}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: getStatusColor(
                        UserOrderDeliveryStatus.fromString(order.status),
                      ).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: getStatusColor(
                          UserOrderDeliveryStatus.fromString(order.status),
                        ).withValues(alpha: 0.3),
                      ),
                    ),
                    child: Text(
                      getStatusText(
                        UserOrderDeliveryStatus.fromString(order.status),
                      ),
                      style: TextStyle(
                        color: getStatusColor(
                          UserOrderDeliveryStatus.fromString(order.status),
                        ),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Product Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(
                      Icons.shopping_bag,
                      size: 20,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getProductNames(order.items),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${order.items.length} item${order.items.length != 1 ? 's' : ''}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Order Date and Delivery Info
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 6),
                  Text(
                    formatDate(order.orderDate),
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    formatDeliveryDate(order.estimatedDeliveryDate),
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Total Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total:',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\u{20B9}${order.totalAmount}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
