import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/diagnosis_section.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/medication_item.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_details_doctor_card.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_details_pet_card.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_details_section_title.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_details_status_header.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/prescription_notes_box.dart';

class PrescriptionDetailsContent extends StatelessWidget {
  const PrescriptionDetailsContent({super.key, required this.prescription});

  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrescriptionDetailsStatusHeader(prescription: prescription),
          const SizedBox(height: 20),
          const PrescriptionDetailsSectionTitle(title: 'Doctor Details'),
          PrescriptionDetailsDoctorCard(doctor: prescription.doctorDetails),
          const SizedBox(height: 20),
          const PrescriptionDetailsSectionTitle(title: 'Pet Details'),
          PrescriptionDetailsPetCard(pet: prescription.petDetails),
          const SizedBox(height: 20),
          DiagnosisSection(prescription: prescription),
          const SizedBox(height: 20),
          const PrescriptionDetailsSectionTitle(title: 'Medications'),
          ...prescription.medications.map((med) => MedicationItem(med: med)),
          if (prescription.notes.isNotEmpty) ...[
            const SizedBox(height: 20),
            const PrescriptionDetailsSectionTitle(title: 'Additional Notes'),
            PrescriptionNotesBox(notes: prescription.notes),
          ],
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                // Empty for now
              },
              icon: const Icon(Icons.download),
              label: const Text('Download Prescription'),
            ),
          ),
        ],
      ),
    );
  }
}
