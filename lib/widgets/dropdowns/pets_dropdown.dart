import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/core/typedefs/select_pet.dart';

class PetsDropdown extends StatelessWidget {
  final Pet? selectedPet; // Allow selectedChild to be nullable
  final List<Pet> pets;
  final SelectPet onSelectingPet;
  const PetsDropdown({
    super.key,
    required this.selectedPet,
    required this.pets,
    this.onSelectingPet,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure we have a valid selected value that exists in the items list
    final Pet? validSelectedPet =
        selectedPet != null && pets.contains(selectedPet)
        ? selectedPet
        : (pets.isNotEmpty ? pets.first : null);

    return DropdownButtonFormField<Pet>(
      value: validSelectedPet,
      items: pets.map((Pet pet) {
        return DropdownMenuItem<Pet>(value: pet, child: Text(pet.name));
      }).toList(),
      onChanged: onSelectingPet,
      decoration: const InputDecoration(
        labelText: 'Select Pet',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null) {
          return 'Please select a pet';
        }
        return null;
      },
    );
  }
}
