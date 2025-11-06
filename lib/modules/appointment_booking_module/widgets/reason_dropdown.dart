// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class ReasonDropdown extends StatelessWidget {
  final String? selectedReason;
  final List<String> reasons;
  final SelectOption onSelectingReason;
  const ReasonDropdown({
    super.key,
    this.selectedReason,
    required this.reasons,
    required this.onSelectingReason,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: (selectedReason != null && selectedReason!.isNotEmpty)
          ? selectedReason
          : null,
      items: reasons.map((category) {
        return DropdownMenuItem(value: category, child: Text(category));
      }).toList(),
      onChanged: onSelectingReason,
      decoration: const InputDecoration(
        labelText: 'Reason',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a reason';
        }
        return null;
      },
    );
  }
}
