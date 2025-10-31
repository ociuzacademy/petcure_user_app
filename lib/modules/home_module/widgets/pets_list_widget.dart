import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/modules/add_pet_module/view/add_pet_page.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_card.dart';

class PetsListWidget extends StatelessWidget {
  const PetsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Pet> pets = FakeData.generateFakePets();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Pets",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      pushWithoutNavBar(
                        context,
                        AddPetPage.route(isLoggedIn: true),
                      );
                    },
                    child: Text(
                      'Add Pet',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
    );
  }
}
