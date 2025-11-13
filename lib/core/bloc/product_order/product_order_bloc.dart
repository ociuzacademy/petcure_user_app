import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_item_update_quantity_response_model.dart';
import 'package:petcure_user_app/modules/cart_module/models/make_purchase_response_model.dart';
import 'package:petcure_user_app/modules/cart_module/services/cart_services.dart';

import 'package:petcure_user_app/modules/product_details_module/model/add_to_cart_response_model.dart';
import 'package:petcure_user_app/modules/product_details_module/model/buy_now_response_model.dart';
import 'package:petcure_user_app/modules/product_details_module/services/product_details_services.dart';

part 'product_order_bloc.freezed.dart';
part 'product_order_event.dart';
part 'product_order_state.dart';

class ProductOrderBloc extends Bloc<ProductOrderEvent, ProductOrderState> {
  ProductOrderBloc() : super(const ProductOrderInitial()) {
    on<_ProductAddingToCart>(_onProductAddingToCart);
    on<_BuyingProductNow>(_onBuyingProductNow);
    on<_UpdatingCartItemQuantity>(_onUpdatingCartItemQuantity);
    on<_MakingPurchase>(_onMakingPurchase);
  }

  Future<void> _onProductAddingToCart(
    _ProductAddingToCart event,
    Emitter<ProductOrderState> emit,
  ) async {
    emit(
      const ProductOrderState.productOrderLoading('Product adding to cart...'),
    );
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final AddToCartResponseModel addToCartResponse =
          await ProductDetailsServices.addtoCart(
            userId: userId,
            productId: event.productId,
          );

      emit(ProductOrderState.productAddToCart(addToCartResponse));
    } catch (e) {
      emit(ProductOrderState.productOrderError(e.toString()));
    }
  }

  Future<void> _onBuyingProductNow(
    _BuyingProductNow event,
    Emitter<ProductOrderState> emit,
  ) async {
    emit(const ProductOrderState.productOrderLoading('Buying the product...'));
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final BuyNowResponseModel addToCartResponse =
          await ProductDetailsServices.buyNow(
            userId: userId,
            productId: event.productId,
          );

      emit(ProductOrderState.buyProductNow(addToCartResponse));
    } catch (e) {
      emit(ProductOrderState.productOrderError(e.toString()));
    }
  }

  Future<void> _onUpdatingCartItemQuantity(
    _UpdatingCartItemQuantity event,
    Emitter<ProductOrderState> emit,
  ) async {
    emit(
      const ProductOrderState.productOrderLoading(
        'Updating cart item quantity...',
      ),
    );
    try {
      final CartItemUpdateQuantityResponseModel response =
          await CartServices.updateCartItemQuantity(
            cartId: event.cartItemId,
            quantity: event.newQuantity,
          );

      emit(ProductOrderState.cartItemQuantityChanged(response));
    } catch (e) {
      emit(ProductOrderState.productOrderError(e.toString()));
    }
  }

  Future<void> _onMakingPurchase(
    _MakingPurchase event,
    Emitter<ProductOrderState> emit,
  ) async {
    emit(const ProductOrderState.productOrderLoading('Making purchase...'));
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final MakePurchaseResponseModel response =
          await CartServices.makePurchase(userId: userId);
      emit(ProductOrderState.purchaseMade(response));
    } catch (e) {
      emit(ProductOrderState.productOrderError(e.toString()));
    }
  }
}
