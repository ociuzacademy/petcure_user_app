import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/core/models/api_models/pet_details_model.dart';
import 'package:petcure_user_app/core/services/pet_services.dart';

part 'pet_details_state.dart';
part 'pet_details_cubit.freezed.dart';

class PetDetailsCubit extends Cubit<PetDetailsState> {
  PetDetailsCubit() : super(const PetDetailsState.initial());

  Future<void> getPetDetails(int petId) async {
    emit(const PetDetailsState.petDetailsLoading());
    try {
      final PetDetailsModel petDetails = await PetServices.getPetDetails(petId);

      emit(PetDetailsState.petDetailsSuccess(petDetails));
    } catch (e) {
      emit(PetDetailsState.petDetailsError(e.toString()));
    }
  }
}
