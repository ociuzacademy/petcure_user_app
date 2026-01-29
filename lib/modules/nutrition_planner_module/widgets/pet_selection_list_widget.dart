import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:petcure_user_app/core/cubit/pets_list/pets_list_cubit.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    as api_models;
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/pet_list_widget.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class PetSelectionListWidget extends StatelessWidget {
  final VoidCallback onResetSelection;
  final Function(api_models.Pet) onPetSelected;
  const PetSelectionListWidget({
    super.key,
    required this.onPetSelected,
    required this.onResetSelection,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PetsListCubit, PetsListState>(
      builder: (context, state) {
        return switch (state) {
          PetsListInitial() ||
          PetsListLoading() => const ListItemLoadingWidget(itemCount: 5),
          PetsListError(:final error) => CustomErrorWidget(
            onRetry: () => onResetSelection(),
            errorMessage: error,
          ),
          UserPetsSuccess(:final userPets) => PetListWidget(
            pets: userPets.pets,
            onPetSelected: onPetSelected,
          ),
        };
      },
    );
  }
}
