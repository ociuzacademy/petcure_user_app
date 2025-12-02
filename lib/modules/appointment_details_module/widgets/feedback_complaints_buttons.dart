import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_details_module/models/appointment_details_model.dart';
import 'package:petcure_user_app/modules/appointment_details_module/provider/feedback_complaint_provider.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/complaint_form_sheet.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/feedback_form_sheet.dart';

class FeedbackComplaintsButtons extends StatelessWidget {
  final int bookingId;
  final Data appointmentData;

  const FeedbackComplaintsButtons({
    super.key,
    required this.bookingId,
    required this.appointmentData,
  });

  bool _shouldShowButtons() {
    // Check if diagnosis and notes are not null
    if (appointmentData.diagnosisAndVerdict == null ||
        appointmentData.notes == null) {
      return false;
    }

    // Check if the booking date has passed
    final now = DateTime.now();
    final bookingDate = appointmentData.date;

    // Compare only the date part (ignore time)
    final today = DateTime(now.year, now.month, now.day);
    final appointmentDay = DateTime(
      bookingDate.year,
      bookingDate.month,
      bookingDate.day,
    );

    return today.isAfter(appointmentDay);
  }

  void _onFeedbackPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => FeedbackComplaintProvider(bookingId: bookingId),
        child: FeedbackFormSheet(bookingId: bookingId),
      ),
    );
  }

  void _onComplaintPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ChangeNotifierProvider(
        create: (_) => FeedbackComplaintProvider(bookingId: bookingId),
        child: ComplaintFormSheet(bookingId: bookingId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_shouldShowButtons()) {
      return const SizedBox.shrink();
    }

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Opinion Matters',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppPalette.firstColor,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Help us improve our service by sharing your experience',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _onFeedbackPressed(context),
                    icon: const Icon(Icons.star_rate, size: 20),
                    label: const Text('Feedback'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.firstColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 2,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _onComplaintPressed(context),
                    icon: const Icon(Icons.report_problem, size: 20),
                    label: const Text('Complaint'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.orange,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      side: const BorderSide(color: Colors.orange, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
