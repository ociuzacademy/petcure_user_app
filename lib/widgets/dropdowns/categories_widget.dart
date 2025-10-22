// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/add_pet_module/typedefs/select_option.dart';

class CategoriesWidget extends StatelessWidget {
  final String? selectedCategory;
  final List<String> categories;
  final SelectOption onSelectingCategory;
  final String? errorText;
  final bool isLoading;
  final bool isError;
  final String? labelText;

  const CategoriesWidget({
    super.key,
    this.selectedCategory,
    required this.categories,
    required this.onSelectingCategory,
    this.errorText,
    this.isLoading = false,
    this.isError = false,
    this.labelText = "Category",
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownButtonFormField<String>(
      value:
          (selectedCategory != null && selectedCategory!.isNotEmpty && !isError)
          ? selectedCategory
          : null,
      items: _buildDropdownItems(),
      onChanged: isError || isLoading ? null : onSelectingCategory,
      decoration: InputDecoration(
        labelText: labelText,
        border: const OutlineInputBorder(),
        errorText: isError ? errorText : null,
        errorStyle: TextStyle(color: theme.colorScheme.error),
        suffixIcon: _buildSuffixIcon(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError ? theme.colorScheme.error : theme.primaryColor,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: isError ? theme.colorScheme.error : Colors.grey,
          ),
        ),
      ),
      style: TextStyle(color: isError ? theme.colorScheme.error : null),
      icon: _buildIcon(),
      borderRadius: BorderRadius.circular(8),
      elevation: 4,
      isExpanded: true,
      validator: (value) {
        if (isError) {
          return errorText;
        }
        if (value == null || value.isEmpty) {
          return 'Please select a $labelText.toLowerCase()';
        }
        return null;
      },
    );
  }

  List<DropdownMenuItem<String>> _buildDropdownItems() {
    if (isError) {
      return [
        DropdownMenuItem(
          value: "error",
          child: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 16),
              SizedBox(width: 8),
              Flexible(child: Text(errorText ?? "Error loading categories")),
            ],
          ),
        ),
      ];
    }

    if (isLoading) {
      return [
        const DropdownMenuItem(
          value: "loading",
          child: Row(
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              SizedBox(width: 8),
              Text("Loading categories..."),
            ],
          ),
        ),
      ];
    }

    return categories.map((category) {
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
