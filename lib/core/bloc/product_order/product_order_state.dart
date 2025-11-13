part of 'product_order_bloc.dart';

@freezed
sealed class ProductOrderState with _$ProductOrderState {
  const factory ProductOrderState.initial() = ProductOrderInitial;
  const factory ProductOrderState.productOrderLoading(String message) =
      ProductOrderLoading;
  const factory ProductOrderState.productOrderError(String errorMessage) =
      ProductOrderError;
  const factory ProductOrderState.productAddToCart(
    AddToCartResponseModel addToCartResponse,
  ) = ProductAddToCart;
  const factory ProductOrderState.buyProductNow(
    BuyNowResponseModel buyNowResponse,
  ) = BuyProductNow;
}
