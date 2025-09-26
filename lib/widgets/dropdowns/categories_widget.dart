// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class CategoriesWidget extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final SelectOption onSelectingCategory;
  const CategoriesWidget({
    super.key,
    this.selectedCategory,
    required this.categories,
    required this.onSelectingCategory,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: (selectedCategory != null && selectedCategory!.isNotEmpty)
          ? selectedCategory
          : null,
      items: categories.map((category) {
        return DropdownMenuItem(value: category, child: Text(category));
      }).toList(),
      onChanged: onSelectingCategory,
      decoration: InputDecoration(
        labelText: "Category",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
