import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_additional_info_section.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_details_section.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_header_card.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_status_chip.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/doctor_info_card.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/pet_info_card.dart';

class AppointmentDetailsView extends StatelessWidget {
  final Data appointmentData;

  const AppointmentDetailsView({super.key, required this.appointmentData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Appointment Header Card
          AppointmentHeaderCard(appointmentData: appointmentData),
          const SizedBox(height: 20),

          // Appointment Details
          AppointmentDetailsSection(appointmentData: appointmentData),
          const SizedBox(height: 20),

          // Doctor Information
          DoctorInfoCard(appointmentData: appointmentData),
          const SizedBox(height: 20),

          // Pet Information
          PetInfoCard(appointmentData: appointmentData),
          const SizedBox(height: 20),

          // Additional Information (if available)
          if (appointmentData.symptoms != null ||
              appointmentData.diagnosisAndVerdict != null ||
              appointmentData.notes != null) ...[
            AppointmentAdditionalInfoSection(appointmentData: appointmentData),
            const SizedBox(height: 20),
          ],

          // Status Chip
          AppointmentStatusChip(appointmentData: appointmentData),
        ],
      ),
    );
  }
}
