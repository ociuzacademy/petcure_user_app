import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/edit_profile_module/providers/edit_profile_provider.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

  static route() =>
      MaterialPageRoute(builder: (context) => const EditProfilePage());
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  void initState() {
    super.initState();
    // Load initial user data when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EditProfileProvider>().loadUserData();
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Profile Image
                          InkWell(
                            onTap: () => provider.pickImage(context),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              backgroundImage: _getProfileImage(provider),
                              child: provider.isLoadingImage
                                  ? const CircularProgressIndicator()
                                  : null,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          // Full Name Field
                          NormalTextField(
                            textEditingController: provider.fullNameController,
                            validatorFunction: provider.validateFullName,
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            textFieldIcon: const Icon(Icons.person),
                            focusNode: provider.fullNameFocusNode,
                            nextFocusNode: provider.emailFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          // Email Field
                          NormalTextField(
                            textEditingController: provider.emailController,
                            validatorFunction: provider.validateEmail,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            textFieldIcon: const Icon(Icons.email_outlined),
                            textInputType: TextInputType.emailAddress,
                            focusNode: provider.emailFocusNode,
                            nextFocusNode: provider.phoneNumberFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          // Phone Number Field
                          NormalTextField(
                            textEditingController:
                                provider.phoneNumberController,
                            validatorFunction: provider.validatePhoneNumber,
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
                            textEditingController: provider.addressController,
                            validatorFunction: provider.validateAddress,
                            labelText: 'Address',
                            hintText: 'Enter your address',
                            textFieldIcon: const Icon(Icons.home),
                            isMultiline: true,
                            focusNode: provider.addressFocusNode,
                            nextFocusNode: provider.passwordFocusNode,
                          ),
                          SizedBox(height: screenSize.height * 0.025),

                          // Password Field
                          NormalTextField(
                            textEditingController: provider.passwordController,
                            validatorFunction: provider.validatePassword,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            textFieldIcon: const Icon(Icons.password),
                            textInputType: TextInputType.visiblePassword,
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
                            onClick: () => provider.updateProfile(context),
                            // isLoading: provider.isUpdatingProfile,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
