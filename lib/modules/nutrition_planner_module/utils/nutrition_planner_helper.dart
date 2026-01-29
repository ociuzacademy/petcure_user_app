import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    as api_models;

class NutritionPlannerHelper {
  final BuildContext context;
  final ValueNotifier<api_models.Pet?> selectedPetNotifier;

  const NutritionPlannerHelper({
    required this.context,
    required this.selectedPetNotifier,
  });

  void onPetSelected(api_models.Pet pet) {
    selectedPetNotifier.value = pet;
    context.read<NutritionPlanBloc>().add(
      NutritionPlanEvent.gettingNutritionPlan(petId: pet.id),
    );
  }

  void resetSelection() {
    selectedPetNotifier.value = null;
    context.read<PetsListCubit>().getUserPets();
  }
}
