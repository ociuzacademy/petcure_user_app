part of 'slots_cubit.dart';

@freezed
sealed class SlotsState with _$SlotsState {
  const factory SlotsState.initial() = SlotsInitial;
  const factory SlotsState.loading() = SlotsLoading;
  const factory SlotsState.success(SlotsModel slots) = SlotsSuccess;
  const factory SlotsState.error(String message) = SlotsError;
}
