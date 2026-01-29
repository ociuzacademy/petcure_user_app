import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_plan_content.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';

class NutritionPlanView extends StatelessWidget {
  final Pet? pet;
  final VoidCallback onResetSelection;
  const NutritionPlanView({
    super.key,
    required this.pet,
    required this.onResetSelection,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NutritionPlanBloc, NutritionPlanState>(
      builder: (context, state) {
        return switch (state) {
          NutritionPlanInitial() || NutritionPlanLoading() => const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(color: AppPalette.firstColor),
                SizedBox(height: 16),
                Text('Generating personalized plan...'),
              ],
            ),
          ),
          NutritionPlanError(:final message) => CustomErrorWidget(
            onRetry: () {
              if (pet != null) {
                context.read<NutritionPlanBloc>().add(
                  NutritionPlanEvent.gettingNutritionPlan(petId: pet!.id),
                );
              }
            },
            errorMessage: message,
          ),
          NutritionPlanSuccess(:final response) => NutritionPlanContent(
            recommendation: response.recommendation,
            onResetSelection: onResetSelection,
          ),
        };
      },
    );
  }
}
