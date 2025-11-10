import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:petcure_user_app/core/models/api_models/pet_product_model.dart';
import 'package:petcure_user_app/modules/home_module/services/home_module_services.dart';

part 'product_cubit.freezed.dart';
part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState.initial());

  Future<void> getPetProductList() async {
    emit(const ProductState.productLoading());
    try {
      final List<PetProductModel> products =
          await HomeModuleServices.getPetProductList();
      emit(ProductState.productListSuccess(products));
    } catch (e) {
      emit(ProductState.productError(e.toString()));
    }
  }
}
