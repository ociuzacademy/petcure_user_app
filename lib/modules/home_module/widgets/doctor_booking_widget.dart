// doctor_booking_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/models/location.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/modules/home_module/utils/doctor_booking_widget_helper.dart';
import 'package:petcure_user_app/modules/home_module/widgets/doctors_list_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/find_doctors_button.dart';
import 'package:petcure_user_app/modules/home_module/widgets/location_input_widget.dart';
import 'package:petcure_user_app/modules/home_module/widgets/pet_selection_widget.dart';

class DoctorBookingWidget extends StatefulWidget {
  const DoctorBookingWidget({super.key});

  @override
  State<DoctorBookingWidget> createState() => _DoctorBookingWidgetState();
}

class _DoctorBookingWidgetState extends State<DoctorBookingWidget> {
  final DoctorBookingWidgetHelper _doctorBookingWidgetHelper =
      const DoctorBookingWidgetHelper();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _doctorBookingWidgetHelper.petsListInit(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoctorBookingProvider(),
      child: MultiBlocListener(
        listeners: [
          BlocListener<PetsListCubit, PetsListState>(
            listener: (context, state) {
              final provider = context.read<DoctorBookingProvider>();

              switch (state) {
                case UserPetsSuccess(:final userPets):
                  provider.setPetsFromApi(userPets);
                  break;
                default:
              }
            },
          ),
          BlocListener<NearbyDoctorsCubit, NearbyDoctorsState>(
            listener: (context, state) {
              final provider = context.read<DoctorBookingProvider>();

              switch (state) {
                case NearbyDoctorsSuccess(:final nearbyDoctors):
                  provider.initializeData(nearbyDoctors);
                  provider.showDoctors = true;
                  break;
                default:
              }
            },
          ),
        ],
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: Text(
                      'Select Pet:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                  const PetSelectionWidget(),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  const LocationInputWidget(),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  FindDoctorsButton(
                    onClickingFindButton: () {
                      debugPrint('Fetching nearby doctors...');
                      final DoctorBookingProvider provider =
                          Provider.of<DoctorBookingProvider>(
                            context,
                            listen: false,
                          );
                      final Location? location = provider
                          .validateNearbyDoctorSearch();
                      if (location != null) {
                        _doctorBookingWidgetHelper.fetchNearbyDoctorsList(
                          context,
                          location,
                        );
                      } else {
                        debugPrint('Nearby doctors list empty');
                      }
                    },
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  DoctorsListWidget(
                    onClickingFindButton: () {
                      final DoctorBookingProvider provider =
                          Provider.of<DoctorBookingProvider>(
                            context,
                            listen: false,
                          );
                      final Location? location = provider
                          .validateNearbyDoctorSearch();
                      if (location != null) {
                        _doctorBookingWidgetHelper.fetchNearbyDoctorsList(
                          context,
                          location,
                        );
                      } else {
                        debugPrint('Nearby doctors list empty');
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
