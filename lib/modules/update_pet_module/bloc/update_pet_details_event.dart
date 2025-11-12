part of 'update_pet_details_bloc.dart';

@freezed
sealed class UpdatePetDetailsEvent with _$UpdatePetDetailsEvent {
  const factory UpdatePetDetailsEvent.started() = _Started;
  const factory UpdatePetDetailsEvent.updatingPetDetails(
    int petId,
    UpdatePetDetails petDetails,
  ) = _UpdatingPetDetails;
}
