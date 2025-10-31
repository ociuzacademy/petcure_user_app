part of 'pet_operations_bloc.dart';

@freezed
class PetOperationsState with _$PetOperationsState {
  const factory PetOperationsState.initial() = PetOperationsInitial;
  const factory PetOperationsState.petOperationsLoading(String message) =
      PetOperationsLoading;
  const factory PetOperationsState.petOperationsError(String errorMessage) =
      PetOperationsError;
  const factory PetOperationsState.addPetSuccess(AddPetResponseModel response) =
      AddPetSuccess;
}
