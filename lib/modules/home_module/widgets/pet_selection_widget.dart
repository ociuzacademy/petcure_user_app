// doctor_booking_widget.dart

import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/widgets/dropdowns/pets_dropdown.dart';
import 'package:provider/provider.dart';

class PetSelectionWidget extends StatelessWidget {
  const PetSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorBookingProvider>();

    return SliverToBoxAdapter(
      child: provider.pets.isNotEmpty
          ? PetsDropdown(
              selectedPet: provider.selectedPet,
              pets: provider.pets,
              onSelectingPet: (pet) {
                provider.setSelectedPet(pet);
                provider.showDoctors = false;
              },
            )
          : PetsDropdown(selectedPet: provider.selectedPet, pets: const []),
    );
  }
}
