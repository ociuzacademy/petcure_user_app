import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/pet.dart' show Pet;
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart'
    hide Pet;
import 'package:petcure_user_app/modules/home_module/widgets/pet_card.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pets_list_empty_state_widget.dart';

class UserPetGrid extends StatelessWidget {
  const UserPetGrid({super.key, required this.userPets});

  final UserPetsModel userPets;

  @override
  Widget build(BuildContext context) {
    if (userPets.pets.isEmpty) {
      return PetsListEmptyStateWidget(context: context);
    }

    // Convert API pets to local Pet model
    final List<Pet> pets = userPets.pets.map((apiPet) {
      return Pet(
        petId: apiPet.id,
        ownerId: apiPet.user,
        name: apiPet.name,
        birthDate: apiPet.birthDate,
        categoryId: apiPet.category,
        category: apiPet.categoryName,
        subCategoryId: apiPet.subCategory,
        subCategory: apiPet.subCategoryName,
        photoUrl: '${AppUrls.baseUrl}/${apiPet.petImage}',
        weight: apiPet.weight,
        gender: apiPet.gender,
        healthConditions: apiPet.healthCondition,
      );
    }).toList();

    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 pets per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7, // Adjust card proportions
      ),
      itemCount: pets.length,
      itemBuilder: (context, index) {
        final pet = pets[index];
        return PetCard(pet: pet);
      },
    );
  }
}
