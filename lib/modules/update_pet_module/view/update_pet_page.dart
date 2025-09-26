// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';

import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/dropdowns/categories_widget.dart';
import 'package:petcure_user_app/widgets/dropdowns/gender_dropdown.dart';
import 'package:petcure_user_app/widgets/dropdowns/options_dropdown.dart';
import 'package:petcure_user_app/widgets/dropdowns/sub_categories_widget.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class UpdatePetPage extends StatefulWidget {
  final Pet pet;
  const UpdatePetPage({super.key, required this.pet});

  @override
  State<UpdatePetPage> createState() => _UpdatePetPageState();

  static route({required Pet pet}) =>
      MaterialPageRoute(builder: (context) => UpdatePetPage(pet: pet));
}

class _UpdatePetPageState extends State<UpdatePetPage> {
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
  final ValueNotifier<String?> _selectedCategory = ValueNotifier<String?>(null);
  final ValueNotifier<String?> _selectedSubCategory = ValueNotifier<String?>(
    null,
  );

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(title: Text("Update child")),
      body: Scaffold(
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
                  constraints: BoxConstraints(
                    maxWidth: screenSize.width * 0.85,
                  ),
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
                            onTap: () {},
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
                      ValueListenableBuilder<String?>(
                        valueListenable: _selectedCategory,
                        builder: (context, selectedCategory, _) {
                          return CategoriesWidget(
                            selectedCategory: selectedCategory,
                            categories: AppHelpers.petCategories.keys.toList(),
                            onSelectingCategory: (value) {
                              _selectedCategory.value = value;
                            },
                          );
                        },
                      ),
                      SizedBox(height: screenSize.height * 0.025),

                      // Sub-Category Dropdown
                      ValueListenableBuilder<String?>(
                        valueListenable: _selectedCategory,
                        builder: (context, selectedCategory, _) {
                          final List<String> subItemsList =
                              selectedCategory != null
                              ? AppHelpers.petCategories[selectedCategory]!
                              : [];
                          return ValueListenableBuilder<String?>(
                            valueListenable: _selectedSubCategory,
                            builder: (context, selectedSubCategory, __) {
                              return SubCategoriesWidget(
                                selectedSubCategory: selectedSubCategory,
                                subCategories: subItemsList,
                                onSelectingSubCategory: (value) {
                                  _selectedSubCategory.value = value;
                                },
                              );
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
                            onPressed: () {},
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
                            onPressed: () {},
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
                        labelText: "Update Pet",
                        onClick: () {},
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      ValueListenableBuilder<File?>(
                        valueListenable: _imageFile,
                        builder: (context, imageFile, _) {
                          if (imageFile == null) {
                            return CachedNetworkImage(
                              imageUrl: widget.pet.photoUrl,
                            );
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
      ),
    );
  }
}
