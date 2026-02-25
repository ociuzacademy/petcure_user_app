import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/cubit/user_profile/user_profile_cubit.dart';
import 'package:petcure_user_app/modules/edit_profile_module/view/edit_profile_page.dart';
import 'package:petcure_user_app/modules/home_module/utils/user_profile_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/profile_item.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class UserProfileWidget extends StatefulWidget {
  final VoidCallback logout;
  const UserProfileWidget({super.key, required this.logout});

  @override
  State<UserProfileWidget> createState() => _UserProfileWidgetState();
}

class _UserProfileWidgetState extends State<UserProfileWidget> {
  late final UserProfileHelper _userProfileHelper;

  @override
  void initState() {
    super.initState();
    _userProfileHelper = UserProfileHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userProfileHelper.userProfileDataInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserProfileCubit, UserProfileState>(
        builder: (context, state) {
          switch (state) {
            case UserProfileInitial _:
            case UserProfileLoading _:
              return const CustomLoadingWidget.centered(
                message: 'Loading profile...',
                indicatorSize: 40.0,
              );
            case UserProfileError(:final errorMessage):
              return CustomErrorWidget(
                onRetry: () =>
                    context.read<UserProfileCubit>().getUserProfileData(),
                errorMessage: errorMessage,
              );
            case UserPrfoileDataSuccess(:final userProfileData):
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Profile Picture
                    Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: CachedNetworkImageProvider(
                          userProfileData.image != null
                              ? '${AppUrls.baseUrl}${userProfileData.image}'
                              : 'https://i.pravatar.cc/300',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Profile Details
                    ProfileItem(
                      icon: Icons.person,
                      title: 'Name',
                      value: userProfileData.username,
                    ),
                    ProfileItem(
                      icon: Icons.email,
                      title: 'Email',
                      value: userProfileData.email,
                    ),
                    ProfileItem(
                      icon: Icons.phone,
                      title: 'Phone',
                      value: userProfileData.phone,
                    ),
                    ProfileItem(
                      icon: Icons.pets,
                      title: 'Number of Pets',
                      value: '${userProfileData.numberOfPets}',
                    ),
                    ProfileItem(
                      icon: Icons.location_on,
                      title: 'Address',
                      value: userProfileData.address,
                    ),
                    ProfileItem(
                      icon: Icons.location_on,
                      title: 'Place',
                      value: userProfileData.place,
                    ),

                    const SizedBox(height: 20),

                    // Edit & Logout Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            pushWithoutNavBar(context, EditProfilePage.route());
                          },
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit Profile'),
                        ),
                        ElevatedButton.icon(
                          onPressed: widget.logout,
                          icon: const Icon(Icons.logout, color: Colors.white),
                          label: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
