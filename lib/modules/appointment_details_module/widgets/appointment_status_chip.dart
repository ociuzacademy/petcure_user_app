import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentStatusChip extends StatelessWidget {
  const AppointmentStatusChip({super.key, required this.appointmentData});

  final Data appointmentData;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final appointmentDate = appointmentData.date;
    final isUpcoming = appointmentDate.isAfter(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: isUpcoming ? Colors.blue[50] : Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isUpcoming ? Colors.blue : Colors.green,
              width: 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                isUpcoming ? Icons.upcoming : Icons.check_circle,
                color: isUpcoming ? Colors.blue : Colors.green,
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                isUpcoming ? 'Upcoming Appointment' : 'Completed',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isUpcoming ? Colors.blue : Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
