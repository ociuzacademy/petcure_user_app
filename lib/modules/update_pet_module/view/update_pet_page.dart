// update_pet_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/cubit/pet_details/pet_details_cubit.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/update_pet_module/bloc/update_pet_details_bloc.dart';
import 'package:petcure_user_app/modules/update_pet_module/class/update_pet_details.dart';
import 'package:petcure_user_app/modules/update_pet_module/providers/update_pet_provider.dart';
import 'package:petcure_user_app/modules/update_pet_module/utils/update_pet_helper.dart';
import 'package:petcure_user_app/modules/update_pet_module/widgets/pet_image_preview.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class UpdatePetPage extends StatefulWidget {
  final int petId;
  const UpdatePetPage({super.key, required this.petId});

  @override
  State<UpdatePetPage> createState() => _UpdatePetPageState();

  static route({required int petId}) =>
      MaterialPageRoute(builder: (context) => UpdatePetPage(petId: petId));
}

class _UpdatePetPageState extends State<UpdatePetPage> {
  @override
  void initState() {
    super.initState();
    UpdatePetHelper.petDetailsInit(context, widget.petId);
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (context) => UpdatePetProvider(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Update Pet')),
        body: Consumer<UpdatePetProvider>(
          builder: (context, provider, child) {
            return MultiBlocListener(
              listeners: [
                BlocListener<PetDetailsCubit, PetDetailsState>(
                  listener: (context, state) {
                    switch (state) {
                      case PetDetailsSuccess(:final petDetails):
                        provider.initializeWithPetDataFromApi(petDetails);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<UpdatePetDetailsBloc, UpdatePetDetailsState>(
                  listener: (context, state) {
                    switch (state) {
                      case UpdatePetDetailsLoading _:
                        OverlayLoader.show(
                          context,
                          message: 'Updating pet details...',
                        );
                        break;
                      case UpdatePetDetailsError(:final errorMessage):
                        OverlayLoader.hide();
                        CustomSnackBar.showError(
                          context,
                          message: errorMessage,
                        );
                        break;
                      case UpdatePetDetailsSuccess(:final response):
                        OverlayLoader.hide();
                        CustomSnackBar.showSuccess(
                          context,
                          message: response.message,
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          HomePage.route(),
                          (_) => false,
                        );
                        break;
                      default:
                        OverlayLoader.hide();
                        break;
                    }
                  },
                ),
              ],
              child: BlocBuilder<PetDetailsCubit, PetDetailsState>(
                builder: (context, state) {
                  return Form(
                    key: provider.formKey,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                          vertical: screenSize.height * 0.05,
                        ),
                        child: SingleChildScrollView(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: screenSize.width * 0.85,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Pet Name Field
                                NormalTextField(
                                  textEditingController:
                                      provider.petNameController,
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter pet name';
                                    }
                                    return null;
                                  },
                                  labelText: "Pet's Name",
                                  hintText: "Enter your pet's name",
                                  focusNode: provider.petNameFocusNode,
                                  nextFocusNode: provider.weightFocusNode,
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Age Fields (Years and Months)
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Year field
                                    SizedBox(
                                      width: screenSize.width * 0.3,
                                      child: NormalTextField(
                                        textEditingController:
                                            provider.ageYearsController,
                                        validatorFunction: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Years';
                                          }
                                          return null;
                                        },
                                        labelText: 'Age (Years)',
                                        hintText: 'Years',
                                        textInputType: TextInputType.number,
                                        isDisabled: true,
                                      ),
                                    ),
                                    // Month field
                                    SizedBox(
                                      width: screenSize.width * 0.3,
                                      child: NormalTextField(
                                        textEditingController:
                                            provider.ageMonthsController,
                                        validatorFunction: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Months';
                                          }
                                          int? months = int.tryParse(value);
                                          if (months != null &&
                                              (months < 0 || months > 11)) {
                                            return '0-11 only';
                                          }
                                          return null;
                                        },
                                        labelText: 'Age (Months)',
                                        hintText: 'Months (0-11)',
                                        textInputType: TextInputType.number,
                                        isDisabled: true,
                                      ),
                                    ),
                                    // Calendar button
                                    Padding(
                                      padding: const EdgeInsets.only(top: 23.0),
                                      child: SizedBox(
                                        width: screenSize.width * 0.135,
                                        height: screenSize.height * 0.06,
                                        child: IconButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            backgroundColor:
                                                AppPalette.firstColor,
                                          ),
                                          icon: const Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                          onPressed: () =>
                                              provider.selectBirthDate(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Gender Dropdown
                                GenderDropdown(
                                  selectedGender: provider.selectedGender ?? '',
                                  onSelectingGender: provider.setSelectedGender,
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Weight Field
                                NormalTextField(
                                  textEditingController:
                                      provider.weightController,
                                  validatorFunction: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter weight';
                                    }
                                    final weight = double.tryParse(value);
                                    if (weight == null || weight <= 0) {
                                      return 'Please enter valid weight';
                                    }
                                    return null;
                                  },
                                  labelText: 'Weight',
                                  hintText: 'Enter weight (in K.G.)',
                                  textInputType: TextInputType.number,
                                  focusNode: provider.weightFocusNode,
                                  nextFocusNode:
                                      provider.medicalConditionFocusNode,
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Health Condition Dropdown
                                OptionsDropdown(
                                  havingSpecificHealthCondition:
                                      provider.havingSpecificHealthCondition,
                                  onSelectingOption: (newValue) {
                                    provider.setHavingSpecificHealthCondition(
                                      newValue == 'Yes',
                                    );

                                    if (!provider
                                        .havingSpecificHealthCondition) {
                                      provider.medicalConditionController.text =
                                          '';
                                    }
                                  },
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Medical Condition Field (Conditional Validation)
                                NormalTextField(
                                  textEditingController:
                                      provider.medicalConditionController,
                                  validatorFunction: (value) {
                                    if (provider
                                            .havingSpecificHealthCondition &&
                                        (value == null || value.isEmpty)) {
                                      return 'Please enter medical condition';
                                    }
                                    return null;
                                  },
                                  labelText: 'Medical Condition',
                                  hintText: 'Enter medical condition',
                                  textFieldIcon: const Icon(
                                    Icons.medical_services,
                                  ),
                                  isMultiline: true,
                                  focusNode: provider.medicalConditionFocusNode,
                                  isDisabled:
                                      !provider.havingSpecificHealthCondition,
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Image Picker Buttons
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppPalette.firstColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          provider.pickImageFromGallery(),
                                      icon: const Icon(
                                        Icons.add_photo_alternate,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                          AppPalette.firstColor,
                                        ),
                                      ),
                                      onPressed: () =>
                                          provider.pickImageFromCamera(),
                                      icon: const Icon(
                                        Icons.add_a_photo,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Update Button
                                CustomButton(
                                  buttonWidth: double.infinity,
                                  backgroundColor: AppPalette.firstColor,
                                  textColor: Colors.white,
                                  labelText: 'Update Pet',
                                  onClick: () {
                                    final UpdatePetDetails? petDetails =
                                        provider.validateForm();
                                    if (petDetails != null) {
                                      UpdatePetHelper.updatePetDetails(
                                        context,
                                        widget.petId,
                                        petDetails,
                                      );
                                    }
                                  },
                                ),
                                SizedBox(height: screenSize.height * 0.025),

                                // Image Preview
                                PetImagePreview(provider: provider),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
