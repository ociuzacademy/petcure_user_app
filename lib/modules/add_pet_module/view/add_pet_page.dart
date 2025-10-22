// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/cubit/pet_category/pet_category_cubit.dart';
import 'package:petcure_user_app/core/models/api_models/pet_category_model.dart';
import 'package:petcure_user_app/core/models/api_models/pet_sub_category_model.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/add_pet_module/utils/add_pet_helper.dart';
import 'package:petcure_user_app/widgets/dropdowns/categories_widget.dart';
import 'package:petcure_user_app/widgets/dropdowns/gender_dropdown.dart';
import 'package:petcure_user_app/widgets/dropdowns/options_dropdown.dart';
import 'package:petcure_user_app/widgets/dropdowns/pet_categories_widget.dart';
import 'package:petcure_user_app/widgets/dropdowns/pet_sub_categories_widget.dart';
import 'package:petcure_user_app/widgets/dropdowns/sub_categories_widget.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class AddPetPage extends StatefulWidget {
  final bool isLoggedIn;
  final int ownerId;
  const AddPetPage({
    super.key,
    required this.isLoggedIn,
    required this.ownerId,
  });

  @override
  State<AddPetPage> createState() => _AddPetPageState();

  static route({required bool isLoggedIn, required int ownerId}) =>
      MaterialPageRoute(
        builder: (context) =>
            AddPetPage(isLoggedIn: isLoggedIn, ownerId: ownerId),
      );
}

class _AddPetPageState extends State<AddPetPage> {
  late final AddPetHelper _addPetHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _petNameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();
  final TextEditingController _ageYearsController = TextEditingController();
  final TextEditingController _ageMonthsController = TextEditingController();

  final FocusNode _petNameFocusNode = FocusNode();
  final FocusNode _weightFocusNode = FocusNode();
  final FocusNode _medicalConditionFocusNode = FocusNode();

  // ValueNotifiers for state
  final ValueNotifier<File?> _imageFile = ValueNotifier<File?>(null);
  final ValueNotifier<DateTime?> _birthDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<String?> _selectedGender = ValueNotifier<String?>(null);
  final ValueNotifier<bool> _havingSpecificHealthCondition =
      ValueNotifier<bool>(false);
  final ValueNotifier<PetCategoryModel?> _selectedCategory =
      ValueNotifier<PetCategoryModel?>(null);
  final ValueNotifier<Subcategory?> _selectedSubCategory =
      ValueNotifier<Subcategory?>(null);

  @override
  void initState() {
    super.initState();
    _addPetHelper = AddPetHelper(
      context: context,
      formKey: _formKey,
      petNameController: _petNameController,
      weightController: _weightController,
      medicalConditionController: _medicalConditionController,
      ageYearsController: _ageYearsController,
      ageMonthsController: _ageMonthsController,
      imageFile: _imageFile,
      selectedGender: _selectedGender,
      havingSpecificHealthCondition: _havingSpecificHealthCondition,
      selectedCategory: _selectedCategory,
      selectedSubCategory: _selectedSubCategory,
      birthDate: _birthDate,
    );

    _addPetHelper.getPetCategories();
  }

  @override
  void dispose() {
    _petNameController.dispose();
    _weightController.dispose();
    _medicalConditionController.dispose();
    _ageYearsController.dispose();
    _ageMonthsController.dispose();

    _petNameFocusNode.dispose();
    _weightFocusNode.dispose();
    _medicalConditionFocusNode.dispose();

    _imageFile.dispose();
    _selectedGender.dispose();
    _havingSpecificHealthCondition.dispose();
    _selectedCategory.dispose();
    _selectedSubCategory.dispose();
    _birthDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Add a Pet")),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.05,
              vertical: screenSize.height * 0.05,
            ),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: screenSize.width * 0.85),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Pet Name Field
                    NormalTextField(
                      textEditingController: _petNameController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter pet name';
                        }
                        return null;
                      },
                      labelText: "Pet's Name",
                      hintText: "Enter your pet's name",
                      focusNode: _petNameFocusNode,
                      nextFocusNode: _weightFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Age Fields (Years and Months)
                    // Alternative solution with fixed widths
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Year field
                        SizedBox(
                          width: screenSize.width * 0.3,
                          child: NormalTextField(
                            textEditingController: _ageYearsController,
                            validatorFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Years';
                              }
                              return null;
                            },
                            labelText: "Age (Years)",
                            hintText: "Years",
                            textInputType: TextInputType.number,
                            isDisabled: true,
                          ),
                        ),
                        // SizedBox(width: 10),
                        // Month field
                        SizedBox(
                          width: screenSize.width * 0.3,
                          child: NormalTextField(
                            textEditingController: _ageMonthsController,
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
                            labelText: "Age (Months)",
                            hintText: "Months (0-11)",
                            textInputType: TextInputType.number,
                            isDisabled: true,
                          ),
                        ),
                        // SizedBox(width: 10),
                        // Calendar button
                        GestureDetector(
                          onTap: _addPetHelper.selectBirthDate,
                          child: Container(
                            width: screenSize.width * 0.2,
                            height: screenSize.height * 0.08,
                            decoration: BoxDecoration(
                              color: AppPalette.firstColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.calendar_month,
                              color: AppPalette.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Gender Dropdown
                    ValueListenableBuilder<String?>(
                      valueListenable: _selectedGender,
                      builder: (context, gender, _) {
                        return GenderDropdown(
                          selectedGender: gender ?? "",
                          onSelectingGender: (newValue) {
                            _selectedGender.value = newValue;
                          },
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Category Dropdown
                    ValueListenableBuilder<PetCategoryModel?>(
                      valueListenable: _selectedCategory,
                      builder: (context, selectedCategory, _) {
                        return BlocBuilder<PetCategoryCubit, PetCategoryState>(
                          builder: (context, state) {
                            switch (state) {
                              case PetCategoryInitial _:
                              case PetCategoriesLoading _:
                                return CategoriesWidget(
                                  categories: [],
                                  onSelectingCategory: (_) {},
                                  isLoading: true,
                                );
                              case PetCategoriesError(:final errorMessage):
                                return CategoriesWidget(
                                  categories: [],
                                  onSelectingCategory: (_) {},
                                  isError: true,
                                  errorText: errorMessage,
                                );
                              case PetCategoriesSuccess(:final petCategories):
                                return PetCategoriesWidget(
                                  selectedCategory: selectedCategory,
                                  categories: petCategories,
                                  onSelectingCategory: (value) {
                                    _selectedCategory.value = value;
                                    _selectedSubCategory.value = null;
                                    _addPetHelper.getPetSubCategories(
                                      petCategories,
                                      value!.id,
                                    );
                                  },
                                );
                              case PetSubCategoriesLoading(
                                :final petCategories,
                              ):
                                return PetCategoriesWidget(
                                  selectedCategory: selectedCategory,
                                  categories: petCategories,
                                  onSelectingCategory: (value) {
                                    _selectedCategory.value = value;
                                    _selectedSubCategory.value =
                                        null; // Reset subcategory when category changes
                                    _addPetHelper.getPetSubCategories(
                                      petCategories,
                                      value!.id,
                                    );
                                  },
                                );
                              case PetSubCategoriesSuccess(
                                :final petCategories,
                              ):
                                return PetCategoriesWidget(
                                  selectedCategory: selectedCategory,
                                  categories: petCategories,
                                  onSelectingCategory: (value) {
                                    _selectedCategory.value = value;
                                    // Reset subcategory when category changes
                                    _selectedSubCategory.value = null;
                                    _addPetHelper.getPetSubCategories(
                                      petCategories,
                                      value!.id,
                                    );
                                  },
                                );
                              case PetSubCategoriesError(:final petCategories):
                                return PetCategoriesWidget(
                                  selectedCategory: selectedCategory,
                                  categories: petCategories,
                                  onSelectingCategory: (value) {
                                    _selectedCategory.value = value;
                                    // Reset subcategory when category changes
                                    _selectedSubCategory.value = null;
                                    _addPetHelper.getPetSubCategories(
                                      petCategories,
                                      value!.id,
                                    );
                                  },
                                );
                              default:
                                return CategoriesWidget(
                                  categories: [],
                                  onSelectingCategory: (_) {},
                                );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Sub-Category Dropdown
                    ValueListenableBuilder<Subcategory?>(
                      valueListenable: _selectedSubCategory,
                      builder: (context, selectedSubCategory, __) {
                        return BlocBuilder<PetCategoryCubit, PetCategoryState>(
                          builder: (context, state) {
                            switch (state) {
                              case PetCategoryInitial _:
                              case PetCategoriesLoading _:
                              case PetCategoriesError _:
                                return SubCategoriesWidget(
                                  subCategories: [],
                                  onSelectingSubCategory: (_) {},
                                );
                              case PetCategoriesSuccess _:
                                return SubCategoriesWidget(
                                  subCategories: [],
                                  onSelectingSubCategory: (_) {},
                                  selectedSubCategory:
                                      "Select a category first",
                                );
                              case PetSubCategoriesLoading _:
                                return SubCategoriesWidget(
                                  subCategories: [],
                                  onSelectingSubCategory: (_) {},
                                  isLoading: true,
                                );
                              case PetSubCategoriesError(:final errorMessage):
                                return SubCategoriesWidget(
                                  subCategories: [],
                                  onSelectingSubCategory: (_) {},
                                  isError: true,
                                  errorText: errorMessage,
                                );
                              case PetSubCategoriesSuccess(
                                :final petSubCategories,
                              ):
                                if (_selectedCategory.value != null) {
                                  return PetSubCategoriesWidget(
                                    selectedSubCategory: selectedSubCategory,
                                    subCategories:
                                        petSubCategories.subcategories,
                                    onSelectingSubCategory: (value) {
                                      _selectedSubCategory.value = value;
                                    },
                                  );
                                } else {
                                  return SubCategoriesWidget(
                                    subCategories: [],
                                    onSelectingSubCategory: (_) {},
                                    selectedSubCategory:
                                        "Select a category first",
                                  );
                                }
                              default:
                                return SubCategoriesWidget(
                                  subCategories: [],
                                  onSelectingSubCategory: (_) {},
                                );
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Weight Field
                    NormalTextField(
                      textEditingController: _weightController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter weight';
                        }
                        return null;
                      },
                      labelText: "Weight",
                      hintText: "Enter weight (in K.G.)",
                      textInputType: TextInputType.number,
                      focusNode: _weightFocusNode,
                      nextFocusNode: _medicalConditionFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Health Condition Dropdown
                    ValueListenableBuilder<bool>(
                      valueListenable: _havingSpecificHealthCondition,
                      builder: (context, hasCondition, _) {
                        return OptionsDropdown(
                          havingSpecificHealthCondition: hasCondition,
                          onSelectingOption: (newValue) {
                            _havingSpecificHealthCondition.value =
                                newValue == "Yes";
                          },
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Medical Condition Field (Conditional Validation)
                    ValueListenableBuilder<bool>(
                      valueListenable: _havingSpecificHealthCondition,
                      builder: (context, hasCondition, _) {
                        return NormalTextField(
                          textEditingController: _medicalConditionController,
                          validatorFunction: (value) {
                            if (hasCondition &&
                                (value == null || value.isEmpty)) {
                              return 'Please enter medical condition';
                            }
                            return null;
                          },
                          labelText: "Medical Condition",
                          hintText: "Enter medical condition",
                          textFieldIcon: Icon(Icons.home),
                          isMultiline: true,
                          focusNode: _medicalConditionFocusNode,
                          isDisabled: !hasCondition,
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          style: const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              AppPalette.firstColor,
                            ),
                          ),
                          onPressed: _addPetHelper.pickImageFromGallery,
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
                          onPressed: _addPetHelper.pickImageFromCamera,
                          icon: const Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Add Pet",
                      onClick: _addPetHelper.addPet,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    ValueListenableBuilder<File?>(
                      valueListenable: _imageFile,
                      builder: (context, imageFile, _) {
                        if (imageFile == null) {
                          return const SizedBox.shrink();
                        }
                        return Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                                image: FileImage(imageFile),
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
                                    _imageFile.value = null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
