// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class OrderDetailsSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  const OrderDetailsSummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.black)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }
}
