// ignore_for_file: public_member_api_docs, sort_constructors_first
// doctor_booking_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/view/appointment_booking_page.dart';

import 'package:petcure_user_app/modules/home_module/cubits/nearby_doctors/nearby_doctors_cubit.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

class DoctorsListWidget extends StatelessWidget {
  final VoidCallback onClickingFindButton;
  const DoctorsListWidget({super.key, required this.onClickingFindButton});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorBookingProvider>();

    return BlocBuilder<NearbyDoctorsCubit, NearbyDoctorsState>(
      builder: (context, state) {
        if (!provider.showDoctors) {
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        }

        switch (state) {
          case NearbyDoctorsInitial _:
          case NearbyDoctorsLoading _:
            return const ListItemLoadingWidget(itemCount: 5, useSliver: true);
          case NearbyDoctorsError(:final errorMessage):
            return CustomErrorWidget.sliver(
              onRetry: onClickingFindButton,
              errorMessage: errorMessage,
            );
          case NearbyDoctorsSuccess _:
            // Check if doctors list is empty
            if (provider.doctors.isEmpty) {
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Available Doctors:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No doctors found nearby',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Please try searching in a different location',
                        style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: onClickingFindButton,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Doctors list is not empty - show the list
            return SliverList.list(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Available Doctors:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ...provider.doctors.map(
                  (doctor) => Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: const Icon(
                        Icons.local_hospital,
                        color: Colors.blue,
                      ),
                      title: Text(doctor.fullName),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(doctor.address),
                          const SizedBox(height: 4),
                          Text(
                            '${doctor.distanceKm.toStringAsFixed(1)} km away',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.green,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          pushWithoutNavBar(
                            context,
                            AppointmentBookingPage.route(
                              pet: provider.selectedPet!,
                              doctor: doctor,
                            ),
                          );
                        },
                        child: const Text('Book'),
                      ),
                    ),
                  ),
                ),
              ],
            );
        }
      },
    );
  }
}
