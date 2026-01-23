part of 'next_vaccine_cubit.dart';

@freezed
sealed class NextVaccineState with _$NextVaccineState {
  const factory NextVaccineState.initial() = NextVaccineInitial;
  const factory NextVaccineState.loading() = NextVaccineLoading;
  const factory NextVaccineState.success(NextVaccineModel vaccineData) =
      NextVaccineSuccess;
  const factory NextVaccineState.error(String message) = NextVaccineError;
}
