part of 'product_details_cubit.dart';

@freezed
sealed class ProductDetailsState with _$ProductDetailsState {
  const factory ProductDetailsState.initial() = ProductDetailsInitial;
  const factory ProductDetailsState.productDetailsLoading() =
      ProductDetailsLoading;
  const factory ProductDetailsState.productDetailsError(String errorMessage) =
      ProductDetailsError;
  const factory ProductDetailsState.productDetailsSuccess(
    PetProductModel product,
  ) = ProductDetailsSuccess;
}
