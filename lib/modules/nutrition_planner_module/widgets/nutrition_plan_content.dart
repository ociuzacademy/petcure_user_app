import 'package:flutter/material.dart';
import 'package:markdown_widget/widget/markdown.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';

class NutritionPlanContent extends StatelessWidget {
  const NutritionPlanContent({
    super.key,
    required this.recommendation,
    required this.onResetSelection,
  });

  final String recommendation;
  final VoidCallback onResetSelection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: MarkdownWidget(data: recommendation, shrinkWrap: false),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: onResetSelection,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppPalette.firstColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Plan for another pet'),
          ),
        ),
      ],
    );
  }
}
