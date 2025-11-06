import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/cubit/pets_list/pets_list_cubit.dart';
import 'package:petcure_user_app/modules/add_pet_module/view/add_pet_page.dart';
import 'package:petcure_user_app/modules/home_module/utils/pet_list_widget_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_list_content.dart';

class PetsListWidget extends StatefulWidget {
  const PetsListWidget({super.key});

  @override
  State<PetsListWidget> createState() => _PetsListWidgetState();
}

class _PetsListWidgetState extends State<PetsListWidget> {
  late final PetListWidgetHelper _petListWidgetHelper;

  @override
  void initState() {
    super.initState();
    _petListWidgetHelper = PetListWidgetHelper(context: context);
    _petListWidgetHelper.userPetsInitialize();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<PetsListCubit, PetsListState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Your Pets',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          pushWithoutNavBar(
                            context,
                            AddPetPage.route(isLoggedIn: true),
                          );
                        },
                        child: const Text(
                          'Add Pet',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Handle different states
              PetListContent(
                onRetry: () => _petListWidgetHelper.userPetsInitialize(),
                state: state,
              ),
            ],
          );
        },
      ),
    );
  }
}
