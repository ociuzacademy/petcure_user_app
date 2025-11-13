part of 'product_order_bloc.dart';

@freezed
sealed class ProductOrderEvent with _$ProductOrderEvent {
  const factory ProductOrderEvent.started() = _Started;
  const factory ProductOrderEvent.productAddingToCart(int productId) =
      _ProductAddingToCart;
  const factory ProductOrderEvent.buyingProductNow(int productId) =
      _BuyingProductNow;
  const factory ProductOrderEvent.updatingCartItemQuantity(
    int cartItemId,
    int newQuantity,
  ) = _UpdatingCartItemQuantity;
  const factory ProductOrderEvent.makingPurchase() = _MakingPurchase;
}
