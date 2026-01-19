part of 'delete_pet_bloc.dart';

@freezed
sealed class DeletePetEvent with _$DeletePetEvent {
  const factory DeletePetEvent.started() = _Started;
  const factory DeletePetEvent.deletePet({required int petId}) = _DeletePet;
}
