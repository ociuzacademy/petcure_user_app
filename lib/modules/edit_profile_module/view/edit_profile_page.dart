import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/edit_profile_module/utils/edit_profile_helper.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  static route() => MaterialPageRoute(builder: (context) => EditProfilePage());
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final EditProfileHelper _editProfileHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  final ValueNotifier<File?> _profileImage = ValueNotifier(null);

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _addressController.dispose();

    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fullNameController.text = 'John Doe';
    _emailController.text = 'user@email.com';
    _phoneNumberController.text = '+91 9876543210';
    _passwordController.text = 'pass';
    _addressController.text =
        '3058 Peck Court, Costa Mesa, California, 92627, United States.';
    _editProfileHelper = EditProfileHelper(
      context: context,
      formKey: _formKey,
      fullNameController: _fullNameController,
      emailController: _emailController,
      phoneNumberController: _phoneNumberController,
      passwordController: _passwordController,
      addressController: _addressController,
      profileImage: _profileImage,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Edit User Details")),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: _profileImage,
                      builder: (context, profileImage, child) {
                        return InkWell(
                          onTap: _editProfileHelper.pickImage,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: profileImage != null
                                ? FileImage(profileImage)
                                : CachedNetworkImageProvider(
                                    'https://i.pravatar.cc/300',
                                  ),
                            child: null,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _fullNameController,
                      validatorFunction: (value) {
                        // add full name validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter full name';
                        }

                        return null;
                      },
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      textFieldIcon: Icon(Icons.person),
                      focusNode: _fullNameFocusNode,
                      nextFocusNode: _emailFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _emailController,
                      validatorFunction: (value) {
                        // add email validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }

                        bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                        ).hasMatch(value);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      textFieldIcon: Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _phoneNumberFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _phoneNumberController,
                      validatorFunction: (value) {
                        // add phone number validation
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }

                        bool phoneValid = RegExp(
                          r'^(\+91[\-\s]?)?[6-9]\d{9}$',
                        ).hasMatch(value);
                        if (!phoneValid) {
                          return 'Please enter a valid phone number';
                        }

                        return null;
                      },
                      labelText: 'Phone Number',
                      hintText: 'Enter your phone number',
                      textInputType: TextInputType.phone,
                      textFieldIcon: Icon(Icons.phone),
                      focusNode: _phoneNumberFocusNode,
                      nextFocusNode: _addressFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _addressController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add your address';
                        }
                        return null;
                      },
                      labelText: "Address",
                      hintText: "Enter your address",
                      textFieldIcon: Icon(Icons.home),
                      isMultiline: true,
                      focusNode: _addressFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _passwordController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }

                        if (value.length < 3) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textFieldIcon: Icon(Icons.password),
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      focusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Edit Parent",
                      onClick: _editProfileHelper.editProfile,
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
