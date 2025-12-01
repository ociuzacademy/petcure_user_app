// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/enums/booking_reason.dart';

class ReasonDropdown extends StatelessWidget {
  final BookingReason? selectedReason;
  final List<BookingReason> reasons;
  final Function(BookingReason?) onSelectingReason;
  const ReasonDropdown({
    super.key,
    this.selectedReason,
    required this.reasons,
    required this.onSelectingReason,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<BookingReason>(
      value: selectedReason,
      items: reasons.map((reason) {
        return DropdownMenuItem(value: reason, child: Text(reason.label));
      }).toList(),
      onChanged: onSelectingReason,
      decoration: const InputDecoration(
        labelText: 'Reason',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please select a reason';
        }
        return null;
      },
    );
  }
}
