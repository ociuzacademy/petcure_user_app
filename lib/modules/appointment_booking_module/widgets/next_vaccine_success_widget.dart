import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/next_vaccine_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/next_vaccine_info_row.dart';

class NextVaccineSuccessWidget extends StatelessWidget {
  const NextVaccineSuccessWidget({super.key, required this.vaccineData});

  final NextVaccineModel vaccineData;

  @override
  Widget build(BuildContext context) {
    final nextVaccine = vaccineData.nextVaccine;

    if (nextVaccine == null) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppPalette.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppPalette.grey200Color, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppPalette.blackColor.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppPalette.firstColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.vaccines_rounded,
                  color: AppPalette.firstColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Upcoming Vaccine',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      nextVaccine.vaccineName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppPalette.firstColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1),
          ),
          NextVaccineInfoRow(
            icon: Icons.coronavirus_rounded,
            label: 'Protects against',
            value: nextVaccine.diseaseProtected,
          ),
          const SizedBox(height: 12),
          NextVaccineInfoRow(
            icon: Icons.calendar_month_rounded,
            label: 'Recommended Age',
            value: nextVaccine.recommendedAge,
          ),
          if (nextVaccine.note.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppPalette.secondColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.info_outline_rounded,
                    color: AppPalette.firstColor,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      nextVaccine.note,
                      style: const TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppPalette.firstColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
