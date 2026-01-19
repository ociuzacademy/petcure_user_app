import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/pet_details_module/models/pet_delete_response_model.dart';
import 'package:petcure_user_app/modules/pet_details_module/services/pet_details_services.dart';

part 'delete_pet_event.dart';
part 'delete_pet_state.dart';
part 'delete_pet_bloc.freezed.dart';

class DeletePetBloc extends Bloc<DeletePetEvent, DeletePetState> {
  DeletePetBloc() : super(const DeletePetInitial()) {
    on<_DeletePet>(_onDeletePet);
  }

  Future<void> _onDeletePet(
    _DeletePet event,
    Emitter<DeletePetState> emit,
  ) async {
    emit(const DeletePetLoading());
    try {
      final response = await PetDetailsServices.deletePet(petId: event.petId);
      emit(DeletePetSuccess(response));
    } catch (e) {
      emit(DeletePetError(e.toString()));
    }
  }
}
