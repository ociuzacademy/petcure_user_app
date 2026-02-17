import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';

class PrescriptionDetailsStatusHeader extends StatelessWidget {
  const PrescriptionDetailsStatusHeader({
    super.key,
    required this.prescription,
  });

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('MMM dd, yyyy');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Prescription #${prescription.id}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              'Issued: ${dateFormat.format(prescription.issuedDate)}',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: prescription.isActive ? Colors.green[50] : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: prescription.isActive
                  ? Colors.green[200]!
                  : Colors.grey[300]!,
            ),
          ),
          child: Text(
            prescription.isActive ? 'Active' : 'Completed',
            style: TextStyle(
              color: prescription.isActive
                  ? Colors.green[700]
                  : Colors.grey[700],
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
