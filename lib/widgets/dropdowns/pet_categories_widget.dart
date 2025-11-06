// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_category_option.dart';

class PetCategoriesWidget extends StatelessWidget {
  final PetCategoryModel? selectedCategory;
  final List<PetCategoryModel> categories;
  final SelectCategoryOption onSelectingCategory;
  const PetCategoriesWidget({
    super.key,
    this.selectedCategory,
    required this.categories,
    required this.onSelectingCategory,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<PetCategoryModel>(
      value: selectedCategory,
      items: categories.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category.petcategory),
        );
      }).toList(),
      onChanged: onSelectingCategory,
      decoration: const InputDecoration(
        labelText: 'Category',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please select a category';
        }
        return null;
      },
    );
  }
}
