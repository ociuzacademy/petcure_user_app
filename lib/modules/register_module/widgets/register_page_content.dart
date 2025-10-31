// ignore_for_file: public_member_api_docs, sort_constructors_first
// register_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/add_pet_module/view/add_pet_page.dart';
import 'package:petcure_user_app/modules/login_module/view/login_page.dart';
import 'package:petcure_user_app/modules/register_module/bloc/register_bloc.dart';
import 'package:petcure_user_app/modules/register_module/class/user_register_details.dart';
import 'package:petcure_user_app/modules/register_module/providers/register_form_provider.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

typedef RegisterMethod = void Function(UserRegisterDetails userDetails);

class RegisterPageContent extends StatelessWidget {
  final RegisterMethod onUserRegister;
  const RegisterPageContent({super.key, required this.onUserRegister});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final registerProvider = Provider.of<RegisterFormProvider>(context);

    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterLoading _:
              OverlayLoader.show(context, message: 'User account registering');
              break;
            case RegisterError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            case UserRegisterSuccess(:final response):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(context, message: response.message);
              Navigator.pushReplacement(
                context,
                AddPetPage.route(
                  isLoggedIn: false,
                  userId: response.data.id.toString(),
                ),
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: Form(
          key: registerProvider.formKey,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Profile Picture Upload
                      InkWell(
                        onTap: () => registerProvider.pickImage(context),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.grey[300],
                          backgroundImage: registerProvider.profileImage != null
                              ? FileImage(registerProvider.profileImage!)
                              : null,
                          child: registerProvider.profileImage == null
                              ? const Icon(
                                  Icons.camera_alt,
                                  size: 40,
                                  color: Colors.black54,
                                )
                              : null,
                        ),
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      NormalTextField(
                        textEditingController:
                            registerProvider.usernameController,
                        validatorFunction: registerProvider.validateUsername,
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        textFieldIcon: const Icon(Icons.person),
                        focusNode: registerProvider.usernameFocusNode,
                        nextFocusNode: registerProvider.emailFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      NormalTextField(
                        textEditingController: registerProvider.emailController,
                        validatorFunction: registerProvider.validateEmail,
                        labelText: 'Email',
                        hintText: 'Enter your email',
                        textFieldIcon: const Icon(Icons.email_outlined),
                        textInputType: TextInputType.emailAddress,
                        focusNode: registerProvider.emailFocusNode,
                        nextFocusNode: registerProvider.phoneNumberFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      NormalTextField(
                        textEditingController:
                            registerProvider.phoneNumberController,
                        validatorFunction: registerProvider.validatePhoneNumber,
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        textInputType: TextInputType.phone,
                        textFieldIcon: const Icon(Icons.phone),
                        focusNode: registerProvider.phoneNumberFocusNode,
                        nextFocusNode: registerProvider.addressFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      NormalTextField(
                        textEditingController:
                            registerProvider.addressController,
                        validatorFunction: registerProvider.validateAddress,
                        labelText: "Address",
                        hintText: "Enter your address",
                        textFieldIcon: const Icon(Icons.home),
                        isMultiline: true,
                        focusNode: registerProvider.addressFocusNode,
                        nextFocusNode: registerProvider.passwordFocusNode,
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
                              textEditingController:
                                  registerProvider.latitudeController,
                              validatorFunction:
                                  registerProvider.validateLocation,
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
                              textEditingController:
                                  registerProvider.longitudeController,
                              validatorFunction:
                                  registerProvider.validateLocation,
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
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: registerProvider.isLoadingLocation
                              ? null
                              : () => registerProvider.getCurrentLocation(
                                  context,
                                ),
                          icon: registerProvider.isLoadingLocation
                              ? const SizedBox(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : const Icon(Icons.my_location),
                          label: registerProvider.isLoadingLocation
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
                      SizedBox(height: screenSize.height * 0.025),

                      NormalTextField(
                        textEditingController:
                            registerProvider.passwordController,
                        validatorFunction: registerProvider.validatePassword,
                        labelText: 'Password',
                        hintText: 'Enter your password',
                        textFieldIcon: const Icon(Icons.password),
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        focusNode: registerProvider.passwordFocusNode,
                      ),
                      SizedBox(height: screenSize.height * 0.025),
                      CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: Colors.white,
                        labelText: "Register",
                        onClick: () {
                          final userDetails = registerProvider.validateForm(
                            context,
                          );
                          if (userDetails != null) {
                            onUserRegister(userDetails);
                          }
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
