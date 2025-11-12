part of 'update_pet_details_bloc.dart';

@freezed
sealed class UpdatePetDetailsState with _$UpdatePetDetailsState {
  const factory UpdatePetDetailsState.initial() = UpdatePetDetailsInitial;
  const factory UpdatePetDetailsState.updatePetDetailsLoading() =
      UpdatePetDetailsLoading;
  const factory UpdatePetDetailsState.updatePetDetailsError(
    String errorMessage,
  ) = UpdatePetDetailsError;
  const factory UpdatePetDetailsState.updatePetDetailsSuccess(
    PetUpdateResponseModel response,
  ) = UpdatePetDetailsSuccess;
}
