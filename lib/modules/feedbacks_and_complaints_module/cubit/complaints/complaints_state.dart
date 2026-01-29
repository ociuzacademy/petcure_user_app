part of 'complaints_cubit.dart';

@freezed
sealed class ComplaintsState with _$ComplaintsState {
  const factory ComplaintsState.initial() = ComplaintsInitial;
  const factory ComplaintsState.loading() = ComplaintsLoading;
  const factory ComplaintsState.loaded(
    UserComplaintsModel userComplaintsModel,
  ) = ComplaintsLoaded;
  const factory ComplaintsState.error(String error) = ComplaintsError;
}
