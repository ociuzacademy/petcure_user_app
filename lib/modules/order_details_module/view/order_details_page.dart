// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/modules/order_details_module/utils/order_details_helper.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/order_details_summary_row.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/progress_step.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/timeline_item.dart';
import 'package:petcure_user_app/core/enums/user_order_delivery_status.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';
import 'package:petcure_user_app/widgets/loaders/overlay_loader.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class OrderDetailsPage extends StatefulWidget {
  final int orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  static route({required int orderId}) => MaterialPageRoute(
    builder: (context) => OrderDetailsPage(orderId: orderId),
  );

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
      orderId: widget.orderId,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderDetailsHelper.orderDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ReorderBloc, ReorderState>(
            listener: (context, state) {
              switch (state) {
                case ReorderLoading _:
                  OverlayLoader.show(context, message: 'Reordering...');
                  break;
                case ReorderError(:final errorMessage):
                  OverlayLoader.hide();
                  CustomSnackBar.showError(context, message: errorMessage);
                  break;
                case ReorderSuccess(:final response):
                  OverlayLoader.hide();
                  CustomSnackBar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    PaymentPage.route(
                      orderId: response.newOrderId,
                      totalRate: response.totalAmount,
                    ),
                    (_) => false,
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
          BlocListener<CancelOrderBloc, CancelOrderState>(
            listener: (context, state) {
              switch (state) {
                case CancelOrderLoading _:
                  OverlayLoader.show(context, message: 'Cancelling order...');
                  break;
                case CancelOrderError(:final errorMessage):
                  OverlayLoader.hide();
                  CustomSnackBar.showError(context, message: errorMessage);
                  break;
                case CancelOrderSuccess(:final response):
                  OverlayLoader.hide();
                  CustomSnackBar.showSuccess(
                    context,
                    message: response.message,
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    HomePage.route(),
                    (_) => false,
                  );
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
        ],
        child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return switch (state) {
              OrderDetailsInitial() => const SizedBox.shrink(),
              OrderDetailsLoading() => const CustomLoadingWidget(
                message: 'Loading order details',
              ),
              OrderDetailsError(:final errorMessage) => CustomErrorWidget(
                onRetry: _orderDetailsHelper.orderDetailsInit,
                errorMessage: errorMessage,
              ),
              OrderDetailsSuccess(:final orderDetails) => Builder(
                builder: (context) {
                  final UserOrderDeliveryStatus status = orderDetails.status;
                  final isOnTheWay =
                      status == UserOrderDeliveryStatus.orderOnTheWay;
                  return SafeArea(
                    child: SingleChildScrollView(
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '#//${orderDetails.id}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Chip(
                                        label: Text(
                                          OrderDetailsHelper.getStatusText(
                                            status,
                                          ),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        backgroundColor:
                                            OrderDetailsHelper.getStatusColor(
                                              status,
                                            ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),

                                  if (status !=
                                      UserOrderDeliveryStatus.orderCancelled)
                                    SizedBox(
                                      child: Column(
                                        children: [
                                          // Order date and status indicator
                                          Row(
                                            children: [
                                              Icon(
                                                OrderDetailsHelper.getStatusIcon(
                                                  status,
                                                ),
                                                size: 16,
                                                color:
                                                    OrderDetailsHelper.getStatusColor(
                                                      status,
                                                    ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                OrderDetailsHelper.formatDate(
                                                  orderDetails.orderDate,
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
                                              const Icon(
                                                Icons.local_shipping,
                                                size: 16,
                                                color: Colors.green,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  status ==
                                                          UserOrderDeliveryStatus
                                                              .orderDelivered
                                                      ? 'Delivered on: ${OrderDetailsHelper.formatDeliveryDate(orderDetails.estimatedDeliveryDate)}'
                                                      : 'Est. Delivery: ${OrderDetailsHelper.formatDeliveryDate(orderDetails.estimatedDeliveryDate)}',
                                                  style: const TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
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
                                    '${orderDetails.items.length} item${orderDetails.items.length != 1 ? 's' : ''}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Delivery Progress (for non-delivered orders)
                          if (status != UserOrderDeliveryStatus.orderDelivered)
                            Column(
                              children: [
                                Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          value:
                                              OrderDetailsHelper.getDeliveryProgress(
                                                status,
                                              ),
                                          backgroundColor: Colors.grey[300],
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                OrderDetailsHelper.getStatusColor(
                                                  status,
                                                ),
                                              ),
                                          minHeight: 8,
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ProgressStep(
                                              status: status,
                                              label: 'Ordered',
                                              step: 1,
                                              getStatusColor: OrderDetailsHelper
                                                  .getStatusColor,
                                            ),
                                            ProgressStep(
                                              status: status,
                                              label: 'Shipped',
                                              step: 2,
                                              getStatusColor: OrderDetailsHelper
                                                  .getStatusColor,
                                            ),
                                            ProgressStep(
                                              status: status,
                                              label: 'Delivered',
                                              step: 3,
                                              getStatusColor: OrderDetailsHelper
                                                  .getStatusColor,
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),

                          const SizedBox(height: 12),

                          // Products list with delivery dates
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: orderDetails.items.length,
                            separatorBuilder: (context, index) =>
                                const Divider(height: 1),
                            itemBuilder: (context, index) {
                              final item = orderDetails.items[index];
                              return ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                leading: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.grey[200],
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl:
                                        '${AppUrls.baseUrl}${item.product.images[0].image}',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            CircularProgressIndicator(
                                              value: progress.progress,
                                              valueColor:
                                                  const AlwaysStoppedAnimation<
                                                    Color
                                                  >(AppPalette.firstColor),
                                            ),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                title: Text(
                                  item.product.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
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
                                          'Delivery: ${OrderDetailsHelper.formatDeliveryDate(orderDetails.estimatedDeliveryDate)}',
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
                                  '\u{20B9}${(item.totalPrice)}',
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                                        '\u{20B9}${orderDetails.totalAmount}',
                                  ),
                                  const SizedBox(height: 8),

                                  // Shipping
                                  const OrderDetailsSummaryRow(
                                    label: 'Shipping',
                                    value: '\u{20B9}0.00',
                                  ),
                                  const SizedBox(height: 8),

                                  // Tax
                                  OrderDetailsSummaryRow(
                                    label: 'Tax',
                                    value:
                                        '\u{20B9}${(double.parse(orderDetails.totalAmount) * 0.08).toStringAsFixed(2)}',
                                  ),
                                  const SizedBox(height: 8),

                                  // Delivery Info
                                  const OrderDetailsSummaryRow(
                                    label: 'Delivery Type',
                                    value: 'Standard Delivery',
                                  ),
                                  const SizedBox(height: 12),

                                  // Divider
                                  const Divider(height: 1),
                                  const SizedBox(height: 12),

                                  // Total
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Total',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Text(
                                        '\u{20B9}${(double.parse(orderDetails.totalAmount) * 1.08).toStringAsFixed(2)}',
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
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
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
                                    date: orderDetails.orderDate,
                                    isCompleted: true,
                                    formatDeliveryDate:
                                        OrderDetailsHelper.formatDeliveryDate,
                                  ),
                                  TimelineItem(
                                    title: 'Estimated Delivery',
                                    date: orderDetails.estimatedDeliveryDate,
                                    isCompleted:
                                        status ==
                                        UserOrderDeliveryStatus.orderDelivered,
                                    formatDeliveryDate:
                                        OrderDetailsHelper.formatDeliveryDate,
                                  ),
                                  if (status ==
                                      UserOrderDeliveryStatus.orderDelivered)
                                    TimelineItem(
                                      title: 'Delivered',
                                      date: orderDetails.estimatedDeliveryDate,
                                      isCompleted: true,
                                      formatDeliveryDate:
                                          OrderDetailsHelper.formatDeliveryDate,
                                    ),
                                  const SizedBox(height: 12),

                                  // Tracking information if shipped
                                  if (status ==
                                          UserOrderDeliveryStatus
                                              .orderOnTheWay ||
                                      status ==
                                          UserOrderDeliveryStatus
                                              .orderDelivered)
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          'TRK-${widget.orderId}',
                                          style: const TextStyle(
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

                          // Action buttons based on status
                          if (status == UserOrderDeliveryStatus.orderPlaced ||
                              status == UserOrderDeliveryStatus.pending)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _orderDetailsHelper
                                    .showCancelOrderDialogueBox,
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
                                    onPressed: () => _orderDetailsHelper
                                        .showQrCodeBottomSheet(orderDetails),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                    ),
                                    icon: const Icon(Icons.qr_code),
                                    label: const Text(
                                      'Show QR Code for Delivery',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),

                          if (status == UserOrderDeliveryStatus.orderDelivered)
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton.icon(
                                onPressed:
                                    _orderDetailsHelper.showReorderDialogueBox,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppPalette.firstColor,
                                  foregroundColor: Colors.white,
                                ),
                                icon: const Icon(Icons.shopping_cart),
                                label: const Text('Reorder'),
                              ),
                            ),

                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  );
                },
              ),
            };
          },
        ),
      ),
    );
  }
}
