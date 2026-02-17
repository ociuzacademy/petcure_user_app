import 'package:flutter/material.dart';

class PrescriptionNotesBox extends StatelessWidget {
  const PrescriptionNotesBox({super.key, required this.notes});

  final String notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber[100]!),
      ),
      child: Text(
        notes,
        style: TextStyle(color: Colors.amber[900], height: 1.5),
      ),
    );
  }
}
