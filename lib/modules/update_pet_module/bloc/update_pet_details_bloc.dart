import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/update_pet_module/class/update_pet_details.dart';
import 'package:petcure_user_app/modules/update_pet_module/models/pet_update_response_model.dart';
import 'package:petcure_user_app/modules/update_pet_module/services/update_pet_services.dart';

part 'update_pet_details_event.dart';
part 'update_pet_details_state.dart';
part 'update_pet_details_bloc.freezed.dart';

class UpdatePetDetailsBloc
    extends Bloc<UpdatePetDetailsEvent, UpdatePetDetailsState> {
  UpdatePetDetailsBloc() : super(const UpdatePetDetailsInitial()) {
    on<_UpdatingPetDetails>(_onUpdatingPetDetails);
  }

  Future<void> _onUpdatingPetDetails(
    _UpdatingPetDetails event,
    Emitter<UpdatePetDetailsState> emit,
  ) async {
    emit(const UpdatePetDetailsState.updatePetDetailsLoading());
    try {
      final PetUpdateResponseModel response =
          await UpdatePetServices.updatePetDetails(
            petId: event.petId,
            petDetails: event.petDetails,
          );

      emit(UpdatePetDetailsState.updatePetDetailsSuccess(response));
    } catch (e) {
      emit(UpdatePetDetailsState.updatePetDetailsError(e.toString()));
    }
  }
}
