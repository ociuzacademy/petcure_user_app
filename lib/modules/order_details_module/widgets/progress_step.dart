// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/typedefs/order_delivery_status_color.dart';
import 'package:petcure_user_app/modules/orders_list_module/enums/user_order_delivery_status.dart';

class ProgressStep extends StatelessWidget {
  final UserOrderDeliveryStatus status;
  final String label;
  final int step;
  final OrderDeliveryStatusColor getStatusColor;
  const ProgressStep({
    super.key,
    required this.status,
    required this.label,
    required this.step,
    required this.getStatusColor,
  });

  @override
  Widget build(BuildContext context) {
    final currentStep = status.index + 1;
    final isCompleted = step <= currentStep;

    return Column(
      children: [
        Icon(
          isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
          color: isCompleted ? getStatusColor(status) : Colors.grey,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isCompleted ? getStatusColor(status) : Colors.grey,
          ),
        ),
      ],
    );
  }
}
