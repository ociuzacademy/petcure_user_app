import 'dart:io';

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/login_module/view/login_page.dart';
import 'package:petcure_user_app/modules/register_module/utils/register_helper.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static route() => MaterialPageRoute(builder: (context) => RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterHelper _registerHelper;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  final FocusNode _fullNameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _addressFocusNode = FocusNode();

  final ValueNotifier<File?> _profileImage = ValueNotifier(null);
  final ValueNotifier<bool> _isLoadingLocation = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _registerHelper = RegisterHelper(
      context: context,
      formKey: _formKey,
      fullNameController: _usernameController,
      emailController: _emailController,
      phoneNumberController: _phoneNumberController,
      passwordController: _passwordController,
      addressController: _addressController,
      latitudeController: _latitudeController,
      longitudeController: _longitudeController,
      profileImage: _profileImage,
      isLoadingLocation: _isLoadingLocation,
    );
  }

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    _usernameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _addressController.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _profileImage.dispose();
    _isLoadingLocation.dispose();

    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneNumberFocusNode.dispose();
    _passwordFocusNode.dispose();
    _addressFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
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
                    // Profile Picture Upload
                    ValueListenableBuilder(
                      valueListenable: _profileImage,
                      builder: (context, profileImage, child) => InkWell(
                        onTap: _registerHelper.pickImage,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: profileImage != null
                              ? FileImage(profileImage)
                              : null,
                          child: profileImage == null
                              ? const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.black54,
                                )
                              : null,
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _usernameController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      textFieldIcon: const Icon(Icons.person),
                      focusNode: _fullNameFocusNode,
                      nextFocusNode: _emailFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _emailController,
                      validatorFunction: (value) {
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
                      textFieldIcon: const Icon(Icons.email_outlined),
                      textInputType: TextInputType.emailAddress,
                      focusNode: _emailFocusNode,
                      nextFocusNode: _phoneNumberFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    NormalTextField(
                      textEditingController: _phoneNumberController,
                      validatorFunction: (value) {
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
                      textFieldIcon: const Icon(Icons.phone),
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
                      textFieldIcon: const Icon(Icons.home),
                      isMultiline: true,
                      focusNode: _addressFocusNode,
                      nextFocusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    // Location Section
                    const Row(
                      children: [
                        Icon(Icons.location_on, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Location Coordinates',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.015),

                    Row(
                      children: [
                        // Latitude Field
                        Expanded(
                          child: NormalTextField(
                            textEditingController: _latitudeController,
                            validatorFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please get your location';
                              }
                              return null;
                            },
                            labelText: 'Latitude',
                            hintText: 'Latitude will appear here',
                            textFieldIcon: const Icon(Icons.north),
                            isDisabled: true,
                          ),
                        ),
                        SizedBox(width: screenSize.width * 0.02),
                        // Longitude Field
                        Expanded(
                          child: NormalTextField(
                            textEditingController: _longitudeController,
                            validatorFunction: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please get your location';
                              }
                              return null;
                            },
                            labelText: 'Longitude',
                            hintText: 'Longitude will appear here',
                            textFieldIcon: const Icon(Icons.east),
                            isDisabled: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.015),

                    // Get Location Button
                    ValueListenableBuilder(
                      valueListenable: _isLoadingLocation,
                      builder: (context, isLoading, child) => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: isLoading
                              ? null
                              : _registerHelper.getCurrentLocation,
                          icon: isLoading
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.my_location),
                          label: isLoading
                              ? const Text('Getting Location...')
                              : const Text('Get Current Location'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade50,
                            foregroundColor: Colors.blue.shade700,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Colors.blue.shade200),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.025),

                    NormalTextField(
                      textEditingController: _passwordController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }

                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      textFieldIcon: const Icon(Icons.password),
                      textInputType: TextInputType.visiblePassword,
                      isPassword: true,
                      focusNode: _passwordFocusNode,
                    ),
                    SizedBox(height: screenSize.height * 0.025),
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: Colors.white,
                      labelText: "Register",
                      onClick: _registerHelper.register,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        InkWell(
          onTap: () => Navigator.pushReplacement(context, LoginPage.route()),
          child: Text(
            "Login Account",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppPalette.firstColor,
            ),
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
