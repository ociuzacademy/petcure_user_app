// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/widgets/dropdowns/pets_dropdown.dart';

class UserPetSelectionWidget extends StatelessWidget {
  const UserPetSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    return SliverToBoxAdapter(
      child: provider.pets.isNotEmpty
          ? PetsDropdown(
              selectedPet: provider.selectedPet,
              pets: provider.pets,
              onSelectingPet: (pet) {
                provider.setSelectedPet(pet);
              },
            )
          : PetsDropdown(selectedPet: provider.selectedPet, pets: []),
    );
  }
}
