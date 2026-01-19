part of 'delete_pet_bloc.dart';

@freezed
sealed class DeletePetState with _$DeletePetState {
  const factory DeletePetState.initial() = DeletePetInitial;
  const factory DeletePetState.loading() = DeletePetLoading;
  const factory DeletePetState.success(PetDeleteResponseModel response) =
      DeletePetSuccess;
  const factory DeletePetState.error(String message) = DeletePetError;
}
