import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/cubit/pets_list/pets_list_cubit.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pets_list_error_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pets_loading_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/user_pet_grid.dart';

class PetListContent extends StatelessWidget {
  const PetListContent({super.key, required this.onRetry, required this.state});

  final VoidCallback onRetry;
  final PetsListState state;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case PetsListLoading _:
        return const PetsLoadingWidget();
      case PetsListError(:final error):
        return PetsListErrorWidget(onRetry: onRetry, errorMessage: error);
      case UserPetsSuccess(:final userPets):
        return UserPetGrid(userPets: userPets);
      default:
        return const PetsLoadingWidget();
    }
  }
}
