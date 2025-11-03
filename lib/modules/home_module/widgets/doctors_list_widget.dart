// doctor_booking_widget.dart

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/view/appointment_booking_page.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:provider/provider.dart';

class DoctorsListWidget extends StatelessWidget {
  const DoctorsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorBookingProvider>();

    if (!provider.showDoctors) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverList.list(
      children: [
        const SizedBox(height: 20),
        const Text(
          'Available Hospitals:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...provider.doctors.map(
          (doctor) => Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.local_hospital, color: Colors.blue),
              title: Text(doctor.name),
              subtitle: Text(doctor.address),
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
}
