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
          const SliverToBoxAdapter(
            child: Text(
              'Select Pet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 8)),
          const UserPetSelectionWidget(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const GetPetHistoryButton(),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          const PetAppointmentHistoryHeader(),
          HistorySpacingWidget(context: context),
          const PetAppointmentHistoryListWidget(),
        ],
      ),
    );
  }
}
