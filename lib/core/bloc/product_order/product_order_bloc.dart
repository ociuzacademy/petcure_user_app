import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';

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
}
