import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_info_item.dart';

class AppointmentAdditionalInfoSection extends StatelessWidget {
  const AppointmentAdditionalInfoSection({
    super.key,
    required this.appointmentData,
  });

  final Data appointmentData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Additional Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
            const SizedBox(height: 16),

            // Symptoms (if available)
            if (appointmentData.symptoms != null) ...[
              AppointmentInfoItem(
                icon: Icons.health_and_safety,
                title: 'Symptoms',
                content: appointmentData.symptoms!,
              ),
              const SizedBox(height: 12),
            ],

            // Diagnosis & Verdict (if available)
            if (appointmentData.diagnosisAndVerdict != null) ...[
              AppointmentInfoItem(
                icon: Icons.assignment,
                title: 'Diagnosis & Verdict',
                content: appointmentData.diagnosisAndVerdict!,
              ),
              const SizedBox(height: 12),
            ],

            // Notes (if available)
            if (appointmentData.notes != null) ...[
              AppointmentInfoItem(
                icon: Icons.note,
                title: 'Notes',
                content: appointmentData.notes!,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
