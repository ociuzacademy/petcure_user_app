import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';

class DiagnosisSection extends StatelessWidget {
  const DiagnosisSection({super.key, required this.prescription});

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Diagnosis',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            prescription.diagnosis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.calendar_month, size: 18, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                'Duration: ${prescription.daysDuration} Days',
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
