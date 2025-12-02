import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorInfoCard extends StatelessWidget {
  const DoctorInfoCard({super.key, required this.appointmentData});

  final Data appointmentData;

  Future<void> _makePhoneCall(BuildContext context, String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (context.mounted) {
          CustomSnackBar.showError(
            context,
            message: 'Unable to make phone call',
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        CustomSnackBar.showError(context, message: 'Error: ${e.toString()}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Check if phone number should be shown
    final bool shouldShowPhone =
        appointmentData.appointmentType == BookingOption.audioCall &&
        AppHelpers.isWithinAppointmentSlot(
          appointmentDate: appointmentData.date,
          slotStart: appointmentData.slotStart,
          slotEnd: appointmentData.slotEnd,
        );

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Doctor Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.person, color: Colors.blue, size: 28),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        appointmentData.doctorName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Doctor ID: ${appointmentData.doctor}',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Contact Information - only show for audio calls within the time slot
            if (shouldShowPhone) ...[
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green, width: 1),
                ),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.green[600], size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Call Now',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            appointmentData.doctorPhone,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.phone_forwarded),
                      color: Colors.green,
                      onPressed: () =>
                          _makePhoneCall(context, appointmentData.doctorPhone),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
