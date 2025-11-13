part of 'cart_items_cubit.dart';

@freezed
sealed class CartItemsState with _$CartItemsState {
  const factory CartItemsState.initial() = CartItemsInitial;
  const factory CartItemsState.cartItemsLoading() = CartItemsLoading;
  const factory CartItemsState.cartItemsError(String errorMessage) =
      CartItemsError;
  const factory CartItemsState.userCartEmpty() = UserCartEmpty;
  const factory CartItemsState.userCartItemsSuccess(
    CartItemsModel cartItemsData,
  ) = UserCartItemsSuccess;
}
