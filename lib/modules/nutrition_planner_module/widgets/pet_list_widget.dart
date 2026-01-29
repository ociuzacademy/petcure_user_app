import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    as api_models;
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/nutrition_planner_module/widgets/pet_card.dart';

class PetListWidget extends StatelessWidget {
  final List<api_models.Pet> pets;
  final Function(api_models.Pet) onPetSelected;
  const PetListWidget({
    super.key,
    required this.pets,
    required this.onPetSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (pets.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.pets, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('No pets found. Please add a pet first.'),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'Select your pet',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Get a personalized nutrition plan for your pet.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: pets.length,
            itemBuilder: (context, index) {
              final pet = pets[index];
              return PetCard(pet: pet, onTap: () => onPetSelected(pet));
            },
          ),
        ),
      ],
    );
  }
}
