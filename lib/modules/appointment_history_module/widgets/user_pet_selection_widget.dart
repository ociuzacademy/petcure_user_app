// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/widgets/dropdowns/pets_dropdown.dart';

class UserPetSelectionWidget extends StatelessWidget {
  const UserPetSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    return SliverToBoxAdapter(
      child: BlocBuilder<PetsListCubit, PetsListState>(
        builder: (context, state) {
          switch (state) {
            case PetsListInitial():
              return PetsDropdown(
                selectedPet: provider.selectedPet,
                pets: const [],
              );
            case PetsListLoading():
              return PetsDropdown(
                selectedPet: provider.selectedPet,
                pets: const [],
              );
            case UserPetsSuccess(:final userPets):
              return PetsDropdown(
                selectedPet: provider.selectedPet,
                pets: userPets.pets,
                onSelectingPet: (pet) {
                  provider.setSelectedPet(pet);
                },
              );
            case PetsListError(:final error):
              return Center(child: Text('Error: $error'));
          }
        },
      ),
    );
  }
}
