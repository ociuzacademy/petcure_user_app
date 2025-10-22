//pet_category_cubit.dart

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';
import 'package:petcure_user_app/core/services/pet_services.dart';

part 'pet_category_cubit.freezed.dart';
part 'pet_category_state.dart';

class PetCategoryCubit extends Cubit<PetCategoryState> {
  PetCategoryCubit() : super(PetCategoryState.initial());

  Future<void> getPetCategories() async {
    emit(const PetCategoryState.petCategoriesLoading());
    try {
      final List<PetCategoryModel> petCategories =
          await PetServices.getPetCategoryList();
      emit(PetCategoryState.petCategoriesSuccess(petCategories));
    } catch (e) {
      emit(PetCategoryState.petCategoriesError(e.toString()));
    }
  }

  Future<void> getPetSubCategories(
    List<PetCategoryModel> petCategories,
    int categoryId,
  ) async {
    emit(PetCategoryState.petSubCategoriesLoading(petCategories));
    try {
      final PetSubCategoryModel petSubCategories =
          await PetServices.getPetSubCategoryList(categoryId: categoryId);
      emit(
        PetCategoryState.petSubCategoriesSuccess(
          petCategories,
          petSubCategories,
        ),
      );
    } catch (e) {
      emit(PetCategoryState.petSubCategoriesError(petCategories, e.toString()));
    }
  }
}
