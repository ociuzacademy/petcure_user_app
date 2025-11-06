// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class OptionsDropdown extends StatelessWidget {
  final bool havingSpecificHealthCondition;
  final SelectOption onSelectingOption;
  const OptionsDropdown({
    super.key,
    required this.havingSpecificHealthCondition,
    this.onSelectingOption,
  });

  static const List<String> options = ['No', 'Yes'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: havingSpecificHealthCondition ? 'Yes' : 'No',
      items: options.map((option) {
        return DropdownMenuItem(value: option, child: Text(option));
      }).toList(),
      onChanged: onSelectingOption,
      decoration: const InputDecoration(
        labelText: 'Has Specific Health Condition?',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null;
      },
    );
  }
}
