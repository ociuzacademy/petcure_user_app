// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_sub_category_option.dart';

class PetSubCategoriesWidget extends StatelessWidget {
  final Subcategory? selectedSubCategory;
  final List<Subcategory> subCategories;
  final SelectSubCategoryOption onSelectingSubCategory;
  const PetSubCategoriesWidget({
    super.key,
    this.selectedSubCategory,
    required this.subCategories,
    required this.onSelectingSubCategory,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Subcategory>(
      value: selectedSubCategory,
      items: subCategories.map((subCategory) {
        return DropdownMenuItem(
          value: subCategory,
          child: Text(subCategory.petsubcategory),
        );
      }).toList(),
      onChanged: onSelectingSubCategory,
      decoration: InputDecoration(
        labelText: "Sub Category",
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please select a sub category';
        }
        return null;
      },
    );
  }
}
