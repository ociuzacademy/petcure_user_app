import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    as api_models;
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/utils/nutrition_planner_helper.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/nutrition_plan_view.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/pet_selection_list_widget.dart';

class NutritionPlannerPage extends StatefulWidget {
  const NutritionPlannerPage({super.key});

  @override
  State<NutritionPlannerPage> createState() => _NutritionPlannerPageState();

  static route() =>
      MaterialPageRoute(builder: (context) => const NutritionPlannerPage());
}

class _NutritionPlannerPageState extends State<NutritionPlannerPage> {
  final ValueNotifier<api_models.Pet?> _selectedPetNotifier =
      ValueNotifier<api_models.Pet?>(null);
  late final NutritionPlannerHelper _nutritionPlannerHelper;

  @override
  void initState() {
    super.initState();
    _nutritionPlannerHelper = NutritionPlannerHelper(
      context: context,
      selectedPetNotifier: _selectedPetNotifier,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _nutritionPlannerHelper.resetSelection();
    });
  }

  @override
  void dispose() {
    _selectedPetNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nutrition Planner'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppPalette.firstColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          ValueListenableBuilder<api_models.Pet?>(
            valueListenable: _selectedPetNotifier,
            builder: (context, selectedPet, _) {
              if (selectedPet != null) {
                return IconButton(
                  icon: const Icon(Icons.refresh, color: AppPalette.firstColor),
                  onPressed: _nutritionPlannerHelper.resetSelection,
                  tooltip: 'Reselect Pet',
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ValueListenableBuilder<api_models.Pet?>(
          valueListenable: _selectedPetNotifier,
          builder: (context, selectedPet, _) {
            if (selectedPet == null) {
              return PetSelectionListWidget(
                onPetSelected: _nutritionPlannerHelper.onPetSelected,
                onResetSelection: _nutritionPlannerHelper.resetSelection,
              );
            }
            return NutritionPlanView(
              pet: selectedPet,
              onResetSelection: _nutritionPlannerHelper.resetSelection,
            );
          },
        ),
      ),
    );
  }
}
