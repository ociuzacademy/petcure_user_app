import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/feedbacks_and_complaints_module/models/user_feedback_model.dart';

class FeedbackCard extends StatelessWidget {
  final Datum feedback;
  const FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < feedback.rating ? Icons.star : Icons.star_border,
                      size: 18,
                      color: index < feedback.rating
                          ? AppPalette.yellowColor
                          : Colors.grey[300],
                    );
                  }),
                ),
                Text(
                  DateFormat('MMM dd, yyyy').format(feedback.createdAt),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              feedback.feedback,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppPalette.firstColor.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.event_note_outlined,
                    size: 14,
                    color: AppPalette.firstColor,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    'Appointment #${feedback.appointment}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppPalette.firstColor,
                    ),
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
