// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/models/order.dart';
import 'package:petcure_user_app/core/typedefs/format_date.dart';
import 'package:petcure_user_app/modules/order_details_module/view/order_details_page.dart';
import 'package:petcure_user_app/modules/orders_list_module/typedefs/delivery_progress.dart';
import 'package:petcure_user_app/modules/orders_list_module/typedefs/delivery_stage.dart';
import 'package:petcure_user_app/core/typedefs/order_delivery_status_color.dart';
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
    required this.getDeliveryProgress,
    required this.getDeliveryStage,
    required this.isDelayed,
  });

  final Order order;
  final OrderDeliveryStatusText getStatusText;
  final OrderDeliveryStatusColor getStatusColor;
  final OrderDeliveryStatusIcon getStatusIcon;
  final FormatDate formatDate;
  final FormatDate formatDeliveryDate;
  final ProductNames getProductNames;
  final DeliveryProgress getDeliveryProgress;
  final DeliveryStage getDeliveryStage;
  final bool isDelayed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.push(context, OrderDetailsPage.route(order: order)),
      child: Card(
        margin: const EdgeInsets.only(bottom: 16),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Order header with ID and status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      order.orderId,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Chip(
                    label: Text(
                      getStatusText(order.orderDeliveryStatus),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    backgroundColor: getStatusColor(order.orderDeliveryStatus),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              if (order.orderDeliveryStatus !=
                  OrderDeliveryStatus.orderCancelled)
                SizedBox(
                  child: Column(
                    children: [
                      // Order date and status indicator
                      Row(
                        children: [
                          Icon(
                            getStatusIcon(order.orderDeliveryStatus),
                            size: 16,
                            color: getStatusColor(order.orderDeliveryStatus),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            formatDate(order.orderDate),
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Estimated Delivery Date
                      Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            size: 16,
                            color: isDelayed ? Colors.red : Colors.green,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Est. Delivery: ${formatDeliveryDate(order.estimatedDeliveryDate)}',
                            style: TextStyle(
                              color: isDelayed ? Colors.red : Colors.green,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (isDelayed) ...[
                            const SizedBox(width: 4),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red[50],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Text(
                                'Delayed',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),

              // Number of items
              Text(
                '${order.productsOrdered.length} item${order.productsOrdered.length != 1 ? 's' : ''}',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 8),

              // Product names (show first 2 items with ellipsis if more)
              Text(
                getProductNames(order.productsOrdered),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              ),
              const SizedBox(height: 12),

              // Delivery progress indicator (for orders not delivered)
              if (order.orderDeliveryStatus !=
                  OrderDeliveryStatus.orderDelivered)
                Column(
                  children: [
                    LinearProgressIndicator(
                      value: getDeliveryProgress(order.orderDeliveryStatus),
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(
                        getStatusColor(order.orderDeliveryStatus),
                      ),
                      minHeight: 4,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getDeliveryStage(order.orderDeliveryStatus, 1),
                          style: TextStyle(
                            fontSize: 10,
                            color: order.orderDeliveryStatus.index >= 0
                                ? getStatusColor(order.orderDeliveryStatus)
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          getDeliveryStage(order.orderDeliveryStatus, 2),
                          style: TextStyle(
                            fontSize: 10,
                            color: order.orderDeliveryStatus.index >= 1
                                ? getStatusColor(order.orderDeliveryStatus)
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          getDeliveryStage(order.orderDeliveryStatus, 3),
                          style: TextStyle(
                            fontSize: 10,
                            color: order.orderDeliveryStatus.index >= 2
                                ? getStatusColor(order.orderDeliveryStatus)
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),

              // Divider
              const Divider(height: 1),
              const SizedBox(height: 12),

              // Total amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total Amount:',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\u{20B9}${order.totalRate.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
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
