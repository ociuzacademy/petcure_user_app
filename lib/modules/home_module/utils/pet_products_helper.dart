// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/cubit/pet_category/pet_category_cubit.dart';
import 'package:petcure_user_app/core/cubit/product/product_cubit.dart';

class PetProductsHelper {
  final BuildContext context;
  const PetProductsHelper({required this.context});

  void petCategoriesInit() {
    final PetCategoryCubit petCategoryCubit = context.read<PetCategoryCubit>();
    petCategoryCubit.getPetCategories();
  }

  void petProductsInit() {
    final ProductCubit productCubit = context.read<ProductCubit>();
    productCubit.getPetProductList();
  }
}
