import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/localstorage/auth_storage_functions.dart';
import 'package:petcure_user_app/modules/home_module/models/user_pets_model.dart';
import 'package:petcure_user_app/modules/home_module/services/home_module_services.dart';

part 'pets_list_state.dart';
part 'pets_list_cubit.freezed.dart';

class PetsListCubit extends Cubit<PetsListState> {
  PetsListCubit() : super(PetsListState.initial());

  Future<void> getUserPets() async {
    emit(const PetsListState.petsListLoading());
    try {
      final String userId = await AuthStorageFunctions.getUserId();

      final UserPetsModel userPets = await HomeModuleServices.getUserPets(
        userId,
      );

      emit(PetsListState.userPetsSuccess(userPets));
    } catch (e) {
      emit(PetsListState.petsListError(e.toString()));
    }
  }
}
