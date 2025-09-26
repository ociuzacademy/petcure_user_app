// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/typedefs/format_date.dart';

class TimelineItem extends StatelessWidget {
  final String title;
  final DateTime date;
  final bool isCompleted;
  final FormatDate formatDeliveryDate;
  const TimelineItem({
    super.key,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.formatDeliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            isCompleted ? Icons.check_circle : Icons.schedule,
            color: isCompleted ? Colors.green : Colors.orange,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: isCompleted ? Colors.green : Colors.orange,
              ),
            ),
          ),
          Text(
            formatDeliveryDate(date),
            style: TextStyle(color: Colors.grey[800], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
