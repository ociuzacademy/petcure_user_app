import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/cart_module/exceptions/empty_cart_exception.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_items_model.dart';
import 'package:petcure_user_app/modules/cart_module/services/cart_services.dart';

part 'cart_items_state.dart';
part 'cart_items_cubit.freezed.dart';

class CartItemsCubit extends Cubit<CartItemsState> {
  CartItemsCubit() : super(const CartItemsState.initial());

  Future<void> getUserCartItems() async {
    emit(const CartItemsState.cartItemsLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final CartItemsModel cartItemsData = await CartServices.getUserCartItems(
        userId: userId,
      );

      emit(CartItemsState.userCartItemsSuccess(cartItemsData));
    } catch (e) {
      if (e is EmptyCartException) {
        emit(const CartItemsState.userCartEmpty());
      } else {
        emit(CartItemsState.cartItemsError(e.toString()));
      }
    }
  }
}
