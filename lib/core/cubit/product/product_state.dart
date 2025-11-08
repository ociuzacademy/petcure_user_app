part of 'product_cubit.dart';

@freezed
sealed class ProductState with _$ProductState {
  const factory ProductState.initial() = ProductInitial;
  const factory ProductState.productLoading() = ProductLoading;
  const factory ProductState.productError(String errorMessage) = ProductError;
  const factory ProductState.productListSuccess(
    List<PetProductModel> products,
  ) = ProductListSuccess;
  const factory ProductState.productDetailsSuccess(PetProductModel product) =
      ProductDetailsSuccess;
}
