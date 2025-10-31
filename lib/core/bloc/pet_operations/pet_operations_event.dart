part of 'pet_operations_bloc.dart';

@freezed
class PetOperationsEvent with _$PetOperationsEvent {
  const factory PetOperationsEvent.started() = _Started;
  const factory PetOperationsEvent.addingPet({
    required AddPetDetails petDetails,
    String? userId,
  }) = _AddingPet;
}
