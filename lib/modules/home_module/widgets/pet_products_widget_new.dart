import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';

class PetProductsWidgetNew extends StatefulWidget {
  const PetProductsWidgetNew({super.key});

  @override
  State<PetProductsWidgetNew> createState() => _PetProductsWidgetNewState();
}

class _PetProductsWidgetNewState extends State<PetProductsWidgetNew> {
  final ValueNotifier<int?> _selectedCategoryId = ValueNotifier<int?>(null);
  final ValueNotifier<List<PetCategoryModel>> _categories =
      ValueNotifier<List<PetCategoryModel>>([]);

  @override
  void initState() {
    super.initState();
    _categories.value.add(const PetCategoryModel(id: 0, petcategory: 'All'));
    _selectedCategoryId.value = 0;
  }

  @override
  void dispose() {
    super.dispose();
    _selectedCategoryId.dispose();
    _categories.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
