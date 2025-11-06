// ignore_for_file: public_member_api_docs, sort_constructors_first
// add_pet_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/add_pet_module/cubit/pet_sub_category_cubit.dart';
import 'package:petcure_user_app/modules/login_module/view/login_page.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/add_pet_module/providers/add_pet_form_provider.dart';
import 'package:petcure_user_app/modules/add_pet_module/utils/add_pet_helper.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class AddPetPageContent extends StatefulWidget {
  final String? userId;
  const AddPetPageContent({super.key, this.userId});

  @override
  State<AddPetPageContent> createState() => _AddPetPageContentState();
}

class _AddPetPageContentState extends State<AddPetPageContent> {
  late final AddPetHelper _addPetHelper;

  @override
  void initState() {
    super.initState();
    _addPetHelper = AddPetHelper(context: context, userId: widget.userId);
    // Initialize categories after the provider is available
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AddPetFormProvider>(context, listen: false);
      provider.getPetCategories(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final provider = Provider.of<AddPetFormProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Add a Pet')),
      body: BlocListener<PetOperationsBloc, PetOperationsState>(
        listener: (context, state) {
          switch (state) {
            case PetOperationsLoading(:final message):
              OverlayLoader.show(context, message: message);
              break;
            case PetOperationsError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            case AddPetSuccess(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.pushAndRemoveUntil(
                context,
                LoginPage.route(),
                (_) => false,
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: Form(
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
                        textEditingController: provider.petNameController,
                        validatorFunction: provider.validatePetName,
                        labelText: "Pet's Name",
                        hintText: "Enter your pet's name",
                        focusNode: provider.petNameFocusNode,
                        nextFocusNode: provider.weightFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Age Fields (Years and Months)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Year field
                          SizedBox(
                            width: screenSize.width * 0.3,
                            child: NormalTextField(
                              textEditingController:
                                  provider.ageYearsController,
                              validatorFunction: provider.validateAgeYears,
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
                              validatorFunction: provider.validateAgeMonths,
                              labelText: 'Age (Months)',
                              hintText: 'Months (0-11)',
                              textInputType: TextInputType.number,
                              isDisabled: true,
                            ),
                          ),
                          // Calendar button
                          GestureDetector(
                            onTap: () => provider.selectBirthDate(context),
                            child: Container(
                              width: screenSize.width * 0.2,
                              height: screenSize.height * 0.08,
                              decoration: BoxDecoration(
                                color: AppPalette.firstColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Gender Dropdown
                      GenderDropdown(
                        selectedGender: provider.selectedGender ?? '',
                        onSelectingGender: (newValue) {
                          provider.selectedGender = newValue;
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Category Dropdown
                      BlocBuilder<PetCategoryCubit, PetCategoryState>(
                        builder: (context, state) {
                          switch (state) {
                            case PetCategoryInitial _:
                            case PetCategoriesLoading _:
                              return CategoriesWidget(
                                categories: const [],
                                onSelectingCategory: (_) {},
                                isLoading: true,
                              );
                            case PetCategoriesError(:final errorMessage):
                              return CategoriesWidget(
                                categories: const [],
                                onSelectingCategory: (_) {},
                                isError: true,
                                errorText: errorMessage,
                              );
                            case PetCategoriesSuccess(:final petCategories):
                              return PetCategoriesWidget(
                                selectedCategory: provider.selectedCategory,
                                categories: petCategories,
                                onSelectingCategory: (value) {
                                  provider.selectedCategory = value;
                                  provider.getPetSubCategories(
                                    context,
                                    value!.id,
                                  );
                                },
                              );
                          }
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Sub-Category Dropdown
                      BlocBuilder<PetSubCategoryCubit, PetSubCategoryState>(
                        builder: (context, state) {
                          switch (state) {
                            case PetSubCategoryInitial _:
                              return SubCategoriesWidget(
                                subCategories: const [],
                                onSelectingSubCategory: (_) {},
                              );

                            case PetSubCategoryLoading _:
                              return SubCategoriesWidget(
                                subCategories: const [],
                                onSelectingSubCategory: (_) {},
                                isLoading: true,
                              );
                            case PetSubCategoryError(:final errorMessage):
                              return SubCategoriesWidget(
                                subCategories: const [],
                                onSelectingSubCategory: (_) {},
                                isError: true,
                                errorText: errorMessage,
                              );
                            case PetSubCategorySuccess(:final petSubCategories):
                              if (provider.selectedCategory != null) {
                                return PetSubCategoriesWidget(
                                  selectedSubCategory:
                                      provider.selectedSubCategory,
                                  subCategories: petSubCategories.subcategories,
                                  onSelectingSubCategory: (value) {
                                    provider.selectedSubCategory = value;
                                  },
                                );
                              } else {
                                return SubCategoriesWidget(
                                  subCategories: const [],
                                  onSelectingSubCategory: (_) {},
                                  selectedSubCategory:
                                      'Select a category first',
                                );
                              }
                          }
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Weight Field
                      NormalTextField(
                        textEditingController: provider.weightController,
                        validatorFunction: provider.validateWeight,
                        labelText: 'Weight',
                        hintText: 'Enter weight (in K.G.)',
                        textInputType: TextInputType.number,
                        focusNode: provider.weightFocusNode,
                        nextFocusNode: provider.medicalConditionFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Health Condition Dropdown
                      OptionsDropdown(
                        havingSpecificHealthCondition:
                            provider.havingSpecificHealthCondition,
                        onSelectingOption: (newValue) {
                          provider.havingSpecificHealthCondition =
                              newValue == 'Yes';
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Medical Condition Field (Conditional Validation)
                      NormalTextField(
                        textEditingController:
                            provider.medicalConditionController,
                        validatorFunction: provider.validateMedicalCondition,
                        labelText: 'Medical Condition',
                        hintText: 'Enter medical condition',
                        textFieldIcon: const Icon(Icons.home),
                        isMultiline: true,
                        focusNode: provider.medicalConditionFocusNode,
                        isDisabled: !provider.havingSpecificHealthCondition,
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Image Upload Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            style: const ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                AppPalette.firstColor,
                              ),
                            ),
                            onPressed: () =>
                                provider.pickImageFromGallery(context),
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
                                provider.pickImageFromCamera(context),
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Add Pet Button
                      CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: Colors.white,
                        labelText: 'Add Pet',
                        onClick: _addPetHelper.addPet,
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Image Preview
                      if (provider.imageFile != null)
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                image: FileImage(provider.imageFile!),
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    provider.imageFile = null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
