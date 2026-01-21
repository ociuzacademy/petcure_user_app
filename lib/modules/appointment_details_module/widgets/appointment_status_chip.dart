import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/booking_status.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';

class AppointmentStatusChip extends StatelessWidget {
  const AppointmentStatusChip({super.key, required this.appointmentData});

  final Data appointmentData;

  @override
  Widget build(BuildContext context) {
    final BookingStatus status = appointmentData.status;

    final (color, bgColor, icon, label) = switch (status) {
      BookingStatus.booked => (
        Colors.blue,
        Colors.blue[50],
        Icons.upcoming,
        'Upcoming Appointment',
      ),
      BookingStatus.paymentCompleted => (
        Colors.orange,
        Colors.orange[50],
        Icons.payment,
        'Payment Completed',
      ),
      BookingStatus.completed => (
        Colors.green,
        Colors.green[50],
        Icons.check_circle,
        'Completed',
      ),
      BookingStatus.cancelled => (
        Colors.red,
        Colors.red[50],
        Icons.cancel,
        'Cancelled',
      ),
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 1),
          ),
          child: Row(
            children: [
              Icon(icon, color: color, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
