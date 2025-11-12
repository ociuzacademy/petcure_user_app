// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';

import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/cubit/pet_details/pet_details_cubit.dart';
import 'package:petcure_user_app/modules/pet_details_module/utils/pet_details_helper.dart';
import 'package:petcure_user_app/modules/pet_details_module/widgets/detail_card.dart';
import 'package:petcure_user_app/modules/pet_details_module/widgets/pet_details_error_widget.dart';
import 'package:petcure_user_app/modules/pet_details_module/widgets/pet_details_loading_widget.dart';
import 'package:petcure_user_app/modules/update_pet_module/view/update_pet_page.dart';

class PetDetailsPage extends StatefulWidget {
  final int petId;
  const PetDetailsPage({super.key, required this.petId});

  static route({required int petId}) =>
      MaterialPageRoute(builder: (context) => PetDetailsPage(petId: petId));

  @override
  State<PetDetailsPage> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends State<PetDetailsPage> {
  late PetDetailsHelper _petDetailsHelper;

  @override
  void initState() {
    super.initState();
    _petDetailsHelper = PetDetailsHelper(context: context, petId: widget.petId);
    // Fetch pet details when the page initializes
    _petDetailsHelper.petDetailsInit();
  }

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
      appBar: AppBar(title: const Text('Pet Details')),
      body: BlocBuilder<PetDetailsCubit, PetDetailsState>(
        builder: (context, state) {
          switch (state) {
            case PetDetailsInitial _:
            case PetDetailsLoading _:
              return const PetDetailsLoadingWidget();
            case PetDetailsError(:final errorMessage):
              return PetDetailsErrorWidget(
                errorMessage: errorMessage,
                onRetry: _petDetailsHelper.petDetailsInit,
              );
            case PetDetailsSuccess(:final petDetails):
              final pet = petDetails.pet;

              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: verticalSpacing,
                ),
                child: Column(
                  children: [
                    // Profile Picture
                    Hero(
                      tag: 'pet-${pet.id}',
                      child: CircleAvatar(
                        radius: avatarRadius,
                        backgroundImage: CachedNetworkImageProvider(
                          '${AppUrls.baseUrl}/${pet.petImage}',
                        ),
                      ),
                    ),
                    SizedBox(height: verticalSpacing),

                    // Update Pet Button
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            UpdatePetPage.route(petId: widget.petId),
                          );
                        },
                        icon: const Icon(Icons.edit),
                        label: const Text('Update Pet Details'),
                      ),
                    ),
                    SizedBox(height: verticalSpacing),

                    // Pet Details
                    DetailCard(
                      icon: Icons.person,
                      title: 'Name',
                      value: pet.name,
                    ),
                    DetailCard(
                      icon: Icons.pets,
                      title: 'Category',
                      value: pet.categoryName.toString(),
                    ),
                    DetailCard(
                      icon: Icons.pets,
                      title: 'Sub-Category',
                      value: pet.subCategoryName.toString(),
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
                      value:
                          pet.gender[0].toUpperCase() + pet.gender.substring(1),
                    ),
                    DetailCard(
                      icon: Icons.monitor_weight,
                      title: 'Weight',
                      value: '${pet.weight} kg',
                    ),
                    if (pet.healthCondition != null &&
                        pet.healthCondition!.isNotEmpty)
                      DetailCard(
                        icon: Icons.medical_services,
                        title: 'Medical Conditions',
                        value: pet.healthCondition!,
                      ),

                    SizedBox(height: verticalSpacing),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
