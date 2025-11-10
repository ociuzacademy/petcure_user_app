import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/models/api_models/pet_product_model.dart';
import 'package:petcure_user_app/modules/product_details_module/services/product_details_services.dart';

part 'product_details_state.dart';
part 'product_details_cubit.freezed.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(const ProductDetailsState.initial());

  Future<void> getPetProductDetails(int productId) async {
    emit(const ProductDetailsState.productDetailsLoading());
    try {
      final PetProductModel product =
          await ProductDetailsServices.getPetProductDetails(
            productId: productId,
          );
      emit(ProductDetailsState.productDetailsSuccess(product));
    } catch (e) {
      emit(ProductDetailsState.productDetailsError(e.toString()));
    }
  }
}
