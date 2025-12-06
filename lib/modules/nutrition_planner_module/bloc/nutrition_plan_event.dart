part of 'nutrition_plan_bloc.dart';

@freezed
sealed class NutritionPlanEvent with _$NutritionPlanEvent {
  const factory NutritionPlanEvent.started() = _Started;
  const factory NutritionPlanEvent.gettingNutritionPlan({
    required NutritionPlannerData nutritionPlannerData,
  }) = _GettingNutritionPlan;
}
