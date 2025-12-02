import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/utils/appointment_detils_helper.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_detail_row.dart';

class AppointmentDetailsSection extends StatelessWidget {
  const AppointmentDetailsSection({super.key, required this.appointmentData});

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
              'Appointment Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
            const SizedBox(height: 16),

            // Date and Time
            AppointmentDetailRow(
              icon: Icons.calendar_today,
              title: 'Date',
              value: AppointmentDetailsHelper.formatDate(appointmentData.date),
            ),
            AppointmentDetailRow(
              icon: Icons.access_time,
              title: 'Time Slot',
              value:
                  '${appointmentData.slotStart} - ${appointmentData.slotEnd}',
            ),

            // Reason (if available)
            if (appointmentData.reason != null) ...[
              const SizedBox(height: 12),
              AppointmentDetailRow(
                icon: Icons.info_outline,
                title: 'Reason',
                value: appointmentData.reason!.label,
                valueColor: Colors.blue,
              ),
            ],

            // Slot ID
            AppointmentDetailRow(
              icon: Icons.confirmation_number,
              title: 'Slot ID',
              value: appointmentData.slotId.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
