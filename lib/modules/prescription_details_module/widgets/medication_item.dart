import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';
import 'package:petcure_user_app/modules/prescription_details_module/widgets/med_details_chip.dart';

class MedicationItem extends StatelessWidget {
  const MedicationItem({super.key, required this.med});

  final Medication med;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.medication, color: Colors.blue),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    med.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Text(
                  med.dosage,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const Divider(height: 24),
            Row(
              children: [
                MedDetailsChip(
                  icon: Icons.restaurant,
                  label: med.foodTiming.name,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: MedDetailsChip(
                    icon: Icons.access_time,
                    label: med.timeOfDay.map((e) => e.name).join(', '),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
