// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';

class PetAppointmentHistoryHeader extends StatelessWidget {
  const PetAppointmentHistoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    if (!provider.showHistory || provider.selectedPet == null) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverToBoxAdapter(
      child: Text(
        'Booking History: ${provider.selectedPet!.name}',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
