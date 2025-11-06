part of 'pet_category_cubit.dart';

@freezed
sealed class PetCategoryState with _$PetCategoryState {
  const factory PetCategoryState.initial() = PetCategoryInitial;
  const factory PetCategoryState.petCategoriesLoading() = PetCategoriesLoading;
  const factory PetCategoryState.petCategoriesError(String errorMessage) =
      PetCategoriesError;
  const factory PetCategoryState.petCategoriesSuccess(
    List<PetCategoryModel> petCategories,
  ) = PetCategoriesSuccess;
}
