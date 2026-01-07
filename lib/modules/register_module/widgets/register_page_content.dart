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
      backgroundColor: AppPalette.firstColor,
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Container(
                height: screenSize.height * 0.25,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppPalette.firstColor, AppPalette.darkFirstColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white24,
                      backgroundImage: AssetImage('assets/icons/icon.png'),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Join PetCure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Create your new account',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.85),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // Form Section in a Card
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Form(
                  key: registerProvider.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Profile Picture Upload
                      Center(
                        child: Stack(
                          children: [
                            InkWell(
                              onTap: () => registerProvider.pickImage(context),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: AppPalette.grey200Color,
                                backgroundImage:
                                    registerProvider.profileImage != null
                                    ? FileImage(registerProvider.profileImage!)
                                    : null,
                                child: registerProvider.profileImage == null
                                    ? const Icon(
                                        Icons.person_outline,
                                        size: 50,
                                        color: AppPalette.greyColor,
                                      )
                                    : null,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: const BoxDecoration(
                                  color: AppPalette.firstColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.camera_alt,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      NormalTextField(
                        textEditingController:
                            registerProvider.usernameController,
                        validatorFunction: registerProvider.validateUsername,
                        labelText: 'Username',
                        hintText: 'Enter your username',
                        textFieldIcon: const Icon(Icons.person_outline),
                        focusNode: registerProvider.usernameFocusNode,
                        nextFocusNode: registerProvider.emailFocusNode,
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      NormalTextField(
                        textEditingController:
                            registerProvider.phoneNumberController,
                        validatorFunction: registerProvider.validatePhoneNumber,
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone number',
                        textInputType: TextInputType.phone,
                        textFieldIcon: const Icon(Icons.phone_outlined),
                        focusNode: registerProvider.phoneNumberFocusNode,
                        nextFocusNode: registerProvider.addressFocusNode,
                      ),
                      const SizedBox(height: 20),
                      NormalTextField(
                        textEditingController:
                            registerProvider.addressController,
                        validatorFunction: registerProvider.validateAddress,
                        labelText: 'Address',
                        hintText: 'Enter your full address',
                        textFieldIcon: const Icon(Icons.location_on_outlined),
                        isMultiline: true,
                        focusNode: registerProvider.addressFocusNode,
                        nextFocusNode: registerProvider.passwordFocusNode,
                      ),
                      const SizedBox(height: 24),

                      // Location Section Header
                      const Text(
                        'Location Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppPalette.firstColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: NormalTextField(
                              textEditingController:
                                  registerProvider.latitudeController,
                              validatorFunction:
                                  registerProvider.validateLocation,
                              labelText: 'Latitude',
                              hintText: '0.0',
                              textFieldIcon: const Icon(Icons.north_outlined),
                              isDisabled: true,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: NormalTextField(
                              textEditingController:
                                  registerProvider.longitudeController,
                              validatorFunction:
                                  registerProvider.validateLocation,
                              labelText: 'Longitude',
                              hintText: '0.0',
                              textFieldIcon: const Icon(Icons.east_outlined),
                              isDisabled: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: registerProvider.isLoadingLocation
                              ? null
                              : () => registerProvider.getCurrentLocation(
                                  context,
                                ),
                          icon: registerProvider.isLoadingLocation
                              ? const SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppPalette.firstColor,
                                  ),
                                )
                              : const Icon(Icons.my_location),
                          label: Text(
                            registerProvider.isLoadingLocation
                                ? 'Fetching...'
                                : 'Auto-locate me',
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppPalette.firstColor,
                            side: const BorderSide(
                              color: AppPalette.firstColor,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      NormalTextField(
                        textEditingController:
                            registerProvider.passwordController,
                        validatorFunction: registerProvider.validatePassword,
                        labelText: 'Password',
                        hintText: 'Create a strong password',
                        textFieldIcon: const Icon(Icons.lock_outline),
                        textInputType: TextInputType.visiblePassword,
                        isPassword: true,
                        focusNode: registerProvider.passwordFocusNode,
                      ),
                      const SizedBox(height: 32),
                      CustomButton(
                        buttonWidth: double.infinity,
                        backgroundColor: AppPalette.firstColor,
                        textColor: Colors.white,
                        labelText: 'Register Now',
                        onClick: () {
                          final userDetails = registerProvider.validateForm(
                            context,
                          );
                          if (userDetails != null) {
                            onUserRegister(userDetails);
                          }
                        },
                      ),
                      const SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              fontSize: 15,
                              color: AppPalette.black87Color,
                            ),
                          ),
                          InkWell(
                            onTap: () => Navigator.pushReplacement(
                              context,
                              LoginPage.route(),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppPalette.firstColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
