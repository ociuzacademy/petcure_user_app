part of 'nearby_doctors_cubit.dart';

@freezed
sealed class NearbyDoctorsState with _$NearbyDoctorsState {
  const factory NearbyDoctorsState.initial() = NearbyDoctorsInitial;
  const factory NearbyDoctorsState.nearbyDoctorsLoading() =
      NearbyDoctorsLoading;
  const factory NearbyDoctorsState.nearbyDoctorsError(String errorMessage) =
      NearbyDoctorsError;
  const factory NearbyDoctorsState.nearbyDoctorsSuccess(
    NearbyDoctorsModel nearbyDoctors,
  ) = NearbyDoctorsSuccess;
}
