// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';

import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/home_module/widgets/info_chip.dart';
import 'package:petcure_user_app/modules/pet_details_module/view/pet_details_page.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  const PetCard({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        pushWithoutNavBar(context, PetDetailsPage.route(pet: pet));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0),
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: "pet-${pet.petId}",
                    child: CachedNetworkImage(
                      imageUrl: pet.photoUrl,
                      height: screenSize.height * 0.175,
                      width: screenSize.width * 0.45,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                            value: progress.progress,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppPalette.firstColor,
                            ),
                          ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: AppPalette.secondColor,
                      child: Icon(
                        pet.gender == 'Male' ? Icons.male : Icons.female,
                        color: AppPalette.firstColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    Text(
                      pet.name,
                      style: TextStyle(
                        fontSize: 25,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "AGE: ${AppHelpers.formatDate(pet.birthDate).toStringAsFixed(1)} years",
                      style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: InfoChip(
                            icon: Icons.pets,
                            text: pet.category.toUpperCase(),
                          ),
                        ),
                        SizedBox(width: 5),
                        Flexible(
                          child: InfoChip(
                            icon: Icons.pets,
                            text: pet.subCategory.toUpperCase(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
