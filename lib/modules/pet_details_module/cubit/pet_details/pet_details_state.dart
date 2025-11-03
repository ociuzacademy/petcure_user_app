part of 'pet_details_cubit.dart';

@freezed
sealed class PetDetailsState with _$PetDetailsState {
  const factory PetDetailsState.initial() = PetDetailsInitial;
  const factory PetDetailsState.petDetailsLoading() = PetDetailsLoading;
  const factory PetDetailsState.petDetailsError(String errorMessage) =
      PetDetailsError;
  const factory PetDetailsState.petDetailsSuccess(PetDetailsModel petDetails) =
      PetDetailsSuccess;
}
