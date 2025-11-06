// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class SubCategoriesWidget extends StatelessWidget {
  final String? selectedSubCategory;
  final List<String> subCategories;
  final SelectOption onSelectingSubCategory;
  final String? errorText;
  final bool isLoading;
  final bool isError;

  const SubCategoriesWidget({
    super.key,
    this.selectedSubCategory,
    required this.subCategories,
    required this.onSelectingSubCategory,
    this.errorText,
    this.isLoading = false,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value:
          (selectedSubCategory != null &&
              selectedSubCategory!.isNotEmpty &&
              !isError)
          ? selectedSubCategory
          : null,
      items: _buildDropdownItems(),
      onChanged: isError || isLoading ? null : onSelectingSubCategory,
      decoration: InputDecoration(
        labelText: 'Sub Category',
        border: const OutlineInputBorder(),
        errorText: isError ? errorText : null,
        errorStyle: const TextStyle(color: Colors.red),
        suffixIcon: _buildSuffixIcon(),
      ),
      style: TextStyle(color: isError ? Colors.red : null),
      icon: _buildIcon(),
      validator: (value) {
        if (isError) {
          return errorText;
        }
        if (value == null || value.isEmpty) {
          return 'Please select a sub category';
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    if (isError) {
      return [
        DropdownMenuItem(
          value: 'error',
          child: Row(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 16),
              const SizedBox(width: 8),
              Flexible(child: Text(errorText ?? 'Error loading categories')),
            ],
          ),
        ),
      ];
    }

    if (isLoading) {
      return [
        const DropdownMenuItem(
          value: 'loading',
          child: Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 8),
              Text('Loading categories...'),
            ],
          ),
        ),
      ];
    }

    return subCategories.map((category) {
      return DropdownMenuItem(value: category, child: Text(category));
    }).toList();
  }

  Widget? _buildSuffixIcon() {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }

    if (isError) {
      return const Padding(
        padding: EdgeInsets.all(12.0),
        child: Icon(Icons.error_outline, color: Colors.red, size: 20),
      );
    }

    return null;
  }

  Widget? _buildIcon() {
    if (isError || isLoading) {
      return const SizedBox.shrink();
    }
    return null;
  }
}
