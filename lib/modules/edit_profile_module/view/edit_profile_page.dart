import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/place_model.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/edit_profile_module/providers/edit_profile_provider.dart';
import 'package:petcure_user_app/modules/edit_profile_module/utils/edit_profile_helper.dart';
import 'package:petcure_user_app/modules/home_module/view/home_page.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const EditProfilePage());
}

class _EditProfilePageState extends State<EditProfilePage> {
  late final EditProfileHelper _editProfileHelper;

  @override
  void initState() {
    super.initState();
    _editProfileHelper = EditProfileHelper(context: context);
    // Load initial user data when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _editProfileHelper.userProfileDataInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: const Text('Edit User Details')),
      body: ChangeNotifierProvider(
        create: (context) => EditProfileProvider(),
        child: Consumer<EditProfileProvider>(
          builder: (context, provider, child) {
            return MultiBlocListener(
              listeners: [
                BlocListener<UserProfileCubit, UserProfileState>(
                  listener: (context, state) {
                    switch (state) {
                      case UserPrfoileDataSuccess(:final userProfileData):
                        provider.loadUserData(userProfileData);
                        break;
                      default:
                    }
                  },
                ),
                BlocListener<EditUserProfileBloc, EditUserProfileState>(
                  listener: (context, state) {
                    switch (state) {
                      case EditUserProfileInitial _:
                      case EditUserProfileLoading _:
                        OverlayLoader.show(
                          context,
                          message: 'Updating user profile...',
                        );
                        break;
                      case EditUserProfileError(:final errorMessage):
                        OverlayLoader.hide();
                        CustomSnackBar.showError(
                          context,
                          message: errorMessage,
                        );
                      case UpdateUserProfileSuccess _:
                        OverlayLoader.hide();
                        CustomSnackBar.showSuccess(
                          context,
                          message: 'User profile updated successfully.',
                        );
                        Navigator.pushAndRemoveUntil(
                          context,
                          HomePage.route(),
                          (route) => false,
                        );
                        break;
                    }
                  },
                ),
              ],
              child: BlocBuilder<UserProfileCubit, UserProfileState>(
                builder: (context, state) {
                  return switch (state) {
                    UserProfileInitial _ => const CustomLoadingWidget.centered(
                      message: 'Loading profile...',
                      indicatorSize: 40.0,
                    ),
                    UserProfileLoading _ => const CustomLoadingWidget.centered(
                      message: 'Loading profile...',
                      indicatorSize: 40.0,
                    ),
                    UserProfileError(:final errorMessage) => CustomErrorWidget(
                      onRetry: _editProfileHelper.userProfileDataInit,
                      errorMessage: errorMessage,
                    ),
                    UserPrfoileDataSuccess _ => SafeArea(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Profile Image
                                    InkWell(
                                      onTap: () => provider.pickImage(context),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 50,
                                            backgroundColor: Colors.grey[300],
                                            backgroundImage: _getProfileImage(
                                              provider,
                                            ),
                                          ),
                                          if (provider.isLoadingImage)
                                            const CircularProgressIndicator(),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Full Name Field
                                    NormalTextField(
                                      textEditingController:
                                          provider.usernameController,
                                      validatorFunction:
                                          provider.validateUsername,
                                      labelText: 'Full Name',
                                      hintText: 'Enter your full name',
                                      textFieldIcon: const Icon(Icons.person),
                                      focusNode: provider.usernameFocusNode,
                                      nextFocusNode: provider.emailFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Email Field
                                    NormalTextField(
                                      textEditingController:
                                          provider.emailController,
                                      validatorFunction: provider.validateEmail,
                                      labelText: 'Email',
                                      hintText: 'Enter your email',
                                      textFieldIcon: const Icon(
                                        Icons.email_outlined,
                                      ),
                                      textInputType: TextInputType.emailAddress,
                                      focusNode: provider.emailFocusNode,
                                      nextFocusNode:
                                          provider.phoneNumberFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Phone Number Field
                                    NormalTextField(
                                      textEditingController:
                                          provider.phoneNumberController,
                                      validatorFunction:
                                          provider.validatePhoneNumber,
                                      labelText: 'Phone Number',
                                      hintText: 'Enter your phone number',
                                      textInputType: TextInputType.phone,
                                      textFieldIcon: const Icon(Icons.phone),
                                      focusNode: provider.phoneNumberFocusNode,
                                      nextFocusNode: provider.addressFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Address Field
                                    NormalTextField(
                                      textEditingController:
                                          provider.addressController,
                                      validatorFunction:
                                          provider.validateAddress,
                                      labelText: 'Address',
                                      hintText: 'Enter your address',
                                      textFieldIcon: const Icon(Icons.home),
                                      isMultiline: true,
                                      focusNode: provider.addressFocusNode,
                                      nextFocusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Place Field
                                    LabelledDropdown<PlaceModel>(
                                      value: provider.place,
                                      items: provider.places,
                                      labelText: 'Place',
                                      hintText: 'Select your place',
                                      prefixIcon: const Icon(
                                        Icons.place_outlined,
                                      ),
                                      itemLabelBuilder: (place) =>
                                          place.displayName,
                                      onChanged: (newValue) =>
                                          provider.place = newValue,
                                      validator: provider.validatePlace,
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
                                                provider.latitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Latitude',
                                            hintText:
                                                'Latitude will appear here',
                                            textFieldIcon: const Icon(
                                              Icons.north,
                                            ),
                                            isDisabled: true,
                                          ),
                                        ),
                                        SizedBox(
                                          width: screenSize.width * 0.02,
                                        ),
                                        // Longitude Field
                                        Expanded(
                                          child: NormalTextField(
                                            textEditingController:
                                                provider.longitudeController,
                                            validatorFunction:
                                                provider.validateLocation,
                                            labelText: 'Longitude',
                                            hintText:
                                                'Longitude will appear here',
                                            textFieldIcon: const Icon(
                                              Icons.east,
                                            ),
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
                                        onPressed: provider.isLoadingLocation
                                            ? null
                                            : () => provider.getCurrentLocation(
                                                context,
                                              ),
                                        icon: provider.isLoadingLocation
                                            ? const SizedBox(
                                                width: 16,
                                                height: 16,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : const Icon(Icons.my_location),
                                        label: provider.isLoadingLocation
                                            ? const Text('Getting Location...')
                                            : const Text(
                                                'Get Current Location',
                                              ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.blue.shade50,
                                          foregroundColor: Colors.blue.shade700,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            side: BorderSide(
                                              color: Colors.blue.shade200,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Password Field
                                    NormalTextField(
                                      textEditingController:
                                          provider.passwordController,
                                      validatorFunction:
                                          provider.validatePassword,
                                      labelText: 'Password',
                                      hintText: 'Enter your password',
                                      textFieldIcon: const Icon(Icons.password),
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      isPassword: true,
                                      focusNode: provider.passwordFocusNode,
                                    ),
                                    SizedBox(height: screenSize.height * 0.025),

                                    // Update Button
                                    CustomButton(
                                      buttonWidth: double.infinity,
                                      backgroundColor: AppPalette.firstColor,
                                      textColor: Colors.white,
                                      labelText: 'Update Profile',
                                      onClick: () {
                                        final editedProfileData = provider
                                            .validateForm(context);
                                        if (editedProfileData != null) {
                                          _editProfileHelper.editProfile(
                                            editedProfileData,
                                          );
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
                  };
                },
              ),
            );
          },
        ),
      ),
    );
  }

  ImageProvider? _getProfileImage(EditProfileProvider provider) {
    if (provider.profileImage != null) {
      return FileImage(provider.profileImage!);
    } else if (provider.initialProfileImageUrl != null) {
      return CachedNetworkImageProvider(provider.initialProfileImageUrl!);
    } else {
      return const CachedNetworkImageProvider('https://i.pravatar.cc/300');
    }
  }
}
