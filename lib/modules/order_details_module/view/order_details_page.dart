// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/models/order.dart';
import 'package:petcure_user_app/modules/order_details_module/utils/order_details_helper.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/order_details_summary_row.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/progress_step.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/timeline_item.dart';

class OrderDetailsPage extends StatefulWidget {
  final Order order;
  const OrderDetailsPage({super.key, required this.order});

  static route({required Order order}) =>
      MaterialPageRoute(builder: (context) => OrderDetailsPage(order: order));

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsHelper _orderDetailsHelper;

  @override
  void initState() {
    super.initState();
    _orderDetailsHelper = OrderDetailsHelper(
      context: context,
      order: widget.order,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDelayed = _orderDetailsHelper.isDeliveryDelayed();
    final isOnTheWay =
        widget.order.orderDeliveryStatus == OrderDeliveryStatus.orderOnTheWay;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        elevation: 0,
        actions: [
          // QR Code Button in AppBar (only for orders on the way)
          if (isOnTheWay)
            IconButton(
              icon: const Icon(Icons.qr_code),
              onPressed: _orderDetailsHelper.showQrCodeBottomSheet,
              tooltip: 'Show QR Code',
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Order summary card
            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order ID and status
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.order.orderId,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Chip(
                          label: Text(
                            _orderDetailsHelper.getStatusText(
                              widget.order.orderDeliveryStatus,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: _orderDetailsHelper.getStatusColor(
                            widget.order.orderDeliveryStatus,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),

                    if (widget.order.orderDeliveryStatus !=
                        OrderDeliveryStatus.orderCancelled)
                      SizedBox(
                        child: Column(
                          children: [
                            // Order date and status indicator
                            Row(
                              children: [
                                Icon(
                                  _orderDetailsHelper.getStatusIcon(
                                    widget.order.orderDeliveryStatus,
                                  ),
                                  size: 16,
                                  color: _orderDetailsHelper.getStatusColor(
                                    widget.order.orderDeliveryStatus,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  _orderDetailsHelper.formatDate(
                                    widget.order.orderDate,
                                  ),
                                  style: const TextStyle(
                                    color: Colors.black,
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
                                Expanded(
                                  child: Text(
                                    widget.order.orderDeliveryStatus ==
                                            OrderDeliveryStatus.orderDelivered
                                        ? 'Delivered on: ${_orderDetailsHelper.formatDeliveryDate(widget.order.estimatedDeliveryDate)}'
                                        : 'Est. Delivery: ${_orderDetailsHelper.formatDeliveryDate(widget.order.estimatedDeliveryDate)}',
                                    style: TextStyle(
                                      color: isDelayed
                                          ? Colors.red
                                          : Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                if (isDelayed)
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
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),

                    // Number of items
                    Text(
                      '${widget.order.productsOrdered.length} item${widget.order.productsOrdered.length != 1 ? 's' : ''}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Delivery Progress (for non-delivered orders)
            if (widget.order.orderDeliveryStatus !=
                OrderDeliveryStatus.orderDelivered)
              Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Delivery Progress',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: _orderDetailsHelper.getDeliveryProgress(),
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              _orderDetailsHelper.getStatusColor(
                                widget.order.orderDeliveryStatus,
                              ),
                            ),
                            minHeight: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProgressStep(
                                order: widget.order,
                                label: 'Ordered',
                                step: 1,
                                getStatusColor:
                                    _orderDetailsHelper.getStatusColor,
                              ),
                              ProgressStep(
                                order: widget.order,
                                label: 'Shipped',
                                step: 2,
                                getStatusColor:
                                    _orderDetailsHelper.getStatusColor,
                              ),
                              ProgressStep(
                                order: widget.order,
                                label: 'Delivered',
                                step: 3,
                                getStatusColor:
                                    _orderDetailsHelper.getStatusColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),

            // Products list header
            const Text(
              'Order Items',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 12),

            // Products list with delivery dates
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.order.productsOrdered.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = widget.order.productsOrdered[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[200],
                    ),
                    child: item.product.imageURLs.isNotEmpty
                        ? Image.network(
                            item.product.imageURLs[0],
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.shopping_bag),
                  ),
                  title: Text(
                    item.product.productName,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Qty: ${item.quantity}'),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            size: 12,
                            color: Colors.green[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Delivery: ${_orderDetailsHelper.formatDeliveryDate(item.deliveryDate)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    '\u{20B9}${(item.productPrice * item.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),

            // Order summary
            const Text(
              'Order Summary',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Subtotal
                    OrderDetailsSummaryRow(
                      label: 'Subtotal',
                      value:
                          '\u{20B9}${widget.order.totalRate.toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 8),

                    // Shipping
                    OrderDetailsSummaryRow(
                      label: 'Shipping',
                      value: '\u{20B9}0.00',
                    ),
                    const SizedBox(height: 8),

                    // Tax
                    OrderDetailsSummaryRow(
                      label: 'Tax',
                      value:
                          '\u{20B9}${(widget.order.totalRate * 0.08).toStringAsFixed(2)}',
                    ),
                    const SizedBox(height: 8),

                    // Delivery Info
                    OrderDetailsSummaryRow(
                      label: 'Delivery Type',
                      value: 'Standard Delivery',
                    ),
                    const SizedBox(height: 12),

                    // Divider
                    const Divider(height: 1),
                    const SizedBox(height: 12),

                    // Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '\u{20B9}${(widget.order.totalRate * 1.08).toStringAsFixed(2)}',
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

            const SizedBox(height: 20),

            // Delivery information
            const Text(
              'Delivery Information',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      '123 Main Street\nNew York, NY 10001\nUnited States',
                      style: TextStyle(color: Colors.black),
                    ),
                    const SizedBox(height: 16),

                    // Delivery Timeline
                    const Text(
                      'Delivery Timeline',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TimelineItem(
                      title: 'Order Placed',
                      date: widget.order.orderDate,
                      isCompleted: true,
                      formatDeliveryDate:
                          _orderDetailsHelper.formatDeliveryDate,
                    ),
                    TimelineItem(
                      title: 'Estimated Delivery',
                      date: widget.order.estimatedDeliveryDate,
                      isCompleted:
                          widget.order.orderDeliveryStatus ==
                          OrderDeliveryStatus.orderDelivered,
                      formatDeliveryDate:
                          _orderDetailsHelper.formatDeliveryDate,
                    ),
                    if (widget.order.orderDeliveryStatus ==
                        OrderDeliveryStatus.orderDelivered)
                      TimelineItem(
                        title: 'Delivered',
                        date: widget.order.estimatedDeliveryDate,
                        isCompleted: true,
                        formatDeliveryDate:
                            _orderDetailsHelper.formatDeliveryDate,
                      ),
                    const SizedBox(height: 12),

                    // Tracking information if shipped
                    if (widget.order.orderDeliveryStatus ==
                            OrderDeliveryStatus.orderOnTheWay ||
                        widget.order.orderDeliveryStatus ==
                            OrderDeliveryStatus.orderDelivered)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(height: 1),
                          const SizedBox(height: 12),
                          const Text(
                            'Tracking Number',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'TRK-${widget.order.orderId.substring(4)}',
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Action buttons based on status
            if (widget.order.orderDeliveryStatus ==
                OrderDeliveryStatus.orderPlaced)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Cancel order logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Cancel Order'),
                ),
              ),

            if (isOnTheWay)
              Column(
                children: [
                  // QR Code Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: _orderDetailsHelper.showQrCodeBottomSheet,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.qr_code),
                      label: const Text('Show QR Code for Delivery'),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),

            if (widget.order.orderDeliveryStatus ==
                OrderDeliveryStatus.orderDelivered)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Reorder logic
                  },
                  child: const Text('Reorder'),
                ),
              ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
