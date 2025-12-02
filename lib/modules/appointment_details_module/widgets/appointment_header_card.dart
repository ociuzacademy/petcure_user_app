import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentHeaderCard extends StatelessWidget {
  const AppointmentHeaderCard({super.key, required this.appointmentData});

  final Data appointmentData;

  @override
  Widget build(BuildContext context) {
    final isClinical =
        appointmentData.appointmentType == BookingOption.clinicalAppointment;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isClinical ? Colors.blue[50] : Colors.green[50],
                shape: BoxShape.circle,
              ),
              child: Icon(
                isClinical ? Icons.local_hospital : Icons.phone,
                color: isClinical ? Colors.blue : Colors.green,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isClinical ? 'Clinical Appointment' : 'Audio Consultation',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Booking ID: #${appointmentData.id}',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
