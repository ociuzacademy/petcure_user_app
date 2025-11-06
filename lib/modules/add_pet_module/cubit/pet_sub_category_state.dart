part of 'pet_sub_category_cubit.dart';

@freezed
sealed class PetSubCategoryState with _$PetSubCategoryState {
  const factory PetSubCategoryState.initial() = PetSubCategoryInitial;
  const factory PetSubCategoryState.petSubCategoryLoading() =
      PetSubCategoryLoading;
  const factory PetSubCategoryState.petSubCategoryError(String errorMessage) =
      PetSubCategoryError;
  const factory PetSubCategoryState.petSubCategorySuccess(
    PetSubCategoryModel petSubCategories,
  ) = PetSubCategorySuccess;
}
