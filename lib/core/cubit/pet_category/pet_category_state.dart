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
  const factory PetCategoryState.petSubCategoriesLoading(
    List<PetCategoryModel> petCategories,
  ) = PetSubCategoriesLoading;
  const factory PetCategoryState.petSubCategoriesSuccess(
    List<PetCategoryModel> petCategories,
    PetSubCategoryModel petSubCategories,
  ) = PetSubCategoriesSuccess;
  const factory PetCategoryState.petSubCategoriesError(
    List<PetCategoryModel> petCategories,
    String errorMessage,
  ) = PetSubCategoriesError;
}
