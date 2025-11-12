import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';
import 'package:petcure_user_app/core/services/pet_services.dart';

part 'pet_sub_category_state.dart';
part 'pet_sub_category_cubit.freezed.dart';

class PetSubCategoryCubit extends Cubit<PetSubCategoryState> {
  PetSubCategoryCubit() : super(const PetSubCategoryState.initial());

  Future<void> getPetSubCategories(int categoryId) async {
    emit(const PetSubCategoryState.petSubCategoryLoading());
    try {
      final PetSubCategoryModel petSubCategories =
          await PetServices.getPetSubCategoryList(categoryId: categoryId);
      emit(PetSubCategoryState.petSubCategorySuccess(petSubCategories));
    } catch (e) {
      emit(PetSubCategoryState.petSubCategoryError(e.toString()));
    }
  }
}
