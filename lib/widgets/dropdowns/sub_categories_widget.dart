// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class SubCategoriesWidget extends StatelessWidget {
  final String? selectedSubCategory;
  final List<String> subCategories;
  final SelectOption onSelectingSubCategory;
  const SubCategoriesWidget({
    super.key,
    this.selectedSubCategory,
    required this.subCategories,
    required this.onSelectingSubCategory,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: (selectedSubCategory != null && selectedSubCategory!.isNotEmpty)
          ? selectedSubCategory
          : null,
      items: subCategories.map((category) {
        return DropdownMenuItem(value: category, child: Text(category));
      }).toList(),
      onChanged: onSelectingSubCategory,
      decoration: InputDecoration(
        labelText: "Sub Category",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a sub category';
        }
        return null;
      },
    );
  }
}
