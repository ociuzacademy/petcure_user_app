// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/modules/appointment_history_module/utils/appointment_history_helper.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/get_pet_history_button.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/history_spacing_widget.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/pet_appointment_history_header.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/pet_appointment_history_list_widget.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/user_pet_selection_widget.dart';
import 'package:provider/provider.dart';

class AppointmentHistoryBody extends StatelessWidget {
  const AppointmentHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppointmentHistoryProvider>(
      builder: (context, provider, child) {
        return MultiBlocListener(
          listeners: [
            BlocListener<AppointmentHistoryCubit, AppointmentHistoryState>(
              listener: (context, state) {
                switch (state) {
                  case AppointmentHistorySuccess _:
                    provider.setShowHistory(true);
                    break;
                  default:
                }
              },
            ),
            BlocListener<PetsListCubit, PetsListState>(
              listener: (context, state) {
                switch (state) {
                  case UserPetsSuccess(:final userPets):
                    provider.setSelectedPet(userPets.pets[0]);
                    break;
                  default:
                }
              },
            ),
          ],
          child: SafeArea(
            child: Padding(
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
                  const UserPetSelectionWidget(),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  GetPetHistoryButton(
                    onFetchingPetAppointmentHistory: () {
                      AppointmentHistoryHelper.getPetHistory(context, provider);
                    },
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                  provider.showHistory
                      ? const PetAppointmentHistoryHeader()
                      : const SliverToBoxAdapter(child: SizedBox()),
                  provider.showHistory
                      ? HistorySpacingWidget(context: context)
                      : const SliverToBoxAdapter(child: SizedBox()),
                  provider.showHistory
                      ? const PetAppointmentHistoryListWidget()
                      : const SliverToBoxAdapter(child: SizedBox()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
