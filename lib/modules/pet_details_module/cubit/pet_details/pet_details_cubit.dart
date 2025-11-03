import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/pet_details_module/models/pet_details_model.dart';
import 'package:petcure_user_app/modules/pet_details_module/services/pet_details_services.dart';

part 'pet_details_state.dart';
part 'pet_details_cubit.freezed.dart';

class PetDetailsCubit extends Cubit<PetDetailsState> {
  PetDetailsCubit() : super(PetDetailsState.initial());

  Future<void> getPetDetails(int petId) async {
    emit(const PetDetailsState.petDetailsLoading());
    try {
      final PetDetailsModel petDetails = await PetDetailsServices.getUserPets(
        petId,
      );

      emit(PetDetailsState.petDetailsSuccess(petDetails));
    } catch (e) {
      emit(PetDetailsState.petDetailsError(e.toString()));
    }
  }
}
