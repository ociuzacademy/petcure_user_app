part of 'nutrition_plan_bloc.dart';

@freezed
sealed class NutritionPlanState with _$NutritionPlanState {
  const factory NutritionPlanState.initial() = NutritionPlanInitial;
  const factory NutritionPlanState.loading() = NutritionPlanLoading;
  const factory NutritionPlanState.success({
    required NutritionPlannerResponseModel response,
  }) = NutritionPlanSuccess;
  const factory NutritionPlanState.error({required String message}) =
      NutritionPlanError;
}
