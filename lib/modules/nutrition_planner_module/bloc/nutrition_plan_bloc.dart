import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/models/nutrition_planner_response_model.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/services/nutrition_planner_services.dart';

part 'nutrition_plan_event.dart';
part 'nutrition_plan_state.dart';
part 'nutrition_plan_bloc.freezed.dart';

class NutritionPlanBloc extends Bloc<NutritionPlanEvent, NutritionPlanState> {
  NutritionPlanBloc() : super(const NutritionPlanInitial()) {
    on<_GettingNutritionPlan>(_onGettingNutritionPlan);
  }

  Future<void> _onGettingNutritionPlan(
    _GettingNutritionPlan event,
    Emitter<NutritionPlanState> emit,
  ) async {
    emit(const NutritionPlanState.loading());
    try {
      final response = await NutritionPlannerServices.getNutritionPlan(
        petId: event.petId,
      );
      emit(NutritionPlanState.success(response: response));
    } catch (e) {
      emit(NutritionPlanState.error(message: e.toString()));
    }
  }
}
