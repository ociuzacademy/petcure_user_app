// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/get_pet_history_button.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/history_spacing_widget.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/pet_appointment_history_header.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/pet_appointment_history_list_widget.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/user_pet_selection_widget.dart';

class AppointmentHistoryBody extends StatelessWidget {
  const AppointmentHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: const Text(
              'Select Pet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 8)),
          UserPetSelectionWidget(),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          GetPetHistoryButton(),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          PetAppointmentHistoryHeader(),
          HistorySpacingWidget(context: context),
          PetAppointmentHistoryListWidget(),
        ],
      ),
    );
  }
}
