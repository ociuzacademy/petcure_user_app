// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';

import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/modules/pet_details_module/widgets/detail_card.dart';
import 'package:petcure_user_app/modules/update_pet_module/view/update_pet_page.dart';

class PetDetailsPage extends StatelessWidget {
  final Pet pet;
  const PetDetailsPage({super.key, required this.pet});

  static route({required Pet pet}) =>
      MaterialPageRoute(builder: (context) => PetDetailsPage(pet: pet));

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    final screenWidth = mq.width;
    final screenHeight = mq.height;

    // responsive paddings & spacings
    final horizontalPadding = (screenWidth * 0.04).clamp(12.0, 24.0);
    final verticalSpacing = (screenHeight * 0.02).clamp(8.0, 32.0);

    // avatar radius derived from width
    final avatarRadius = (screenWidth * 0.12).clamp(40.0, 80.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pet Details'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(context, UpdatePetPage.route(pet: pet));
            },
            child: Text("Update Pet"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalSpacing,
        ),
        child: Column(
          children: [
            // Profile Picture
            Hero(
              tag: "pet-${pet.petId}",
              child: CircleAvatar(
                radius: avatarRadius,
                backgroundImage: CachedNetworkImageProvider(pet.photoUrl),
              ),
            ),
            SizedBox(height: verticalSpacing),

            // Child Details
            DetailCard(icon: Icons.person, title: 'Name', value: pet.name),
            DetailCard(
              icon: Icons.pets,
              title: 'Category',
              value: pet.category,
            ),
            DetailCard(
              icon: Icons.pets,
              title: 'Sub-Category',
              value: pet.subCategory,
            ),
            DetailCard(
              icon: Icons.cake,
              title: 'Age',
              value:
                  '${AppHelpers.formatDate(pet.birthDate).toStringAsFixed(1)} Years',
            ),
            DetailCard(
              icon: Icons.transgender,
              title: 'Gender',
              value: pet.gender,
            ),
            DetailCard(
              icon: Icons.monitor_weight,
              title: 'Weight',
              value: '${pet.weight} kg',
            ),
            if (pet.healthConditions != null)
              DetailCard(
                icon: Icons.medical_services,
                title: 'Medical Conditions',
                value: pet.healthConditions!,
              ),

            SizedBox(height: verticalSpacing),
          ],
        ),
      ),
    );
  }
}
