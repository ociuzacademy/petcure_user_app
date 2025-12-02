// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';

class AppointmentHistoryHelper {
  final BuildContext context;
  const AppointmentHistoryHelper({required this.context});

  void userPetsListInit() {
    final PetsListCubit petsListCubit = context.read<PetsListCubit>();
    petsListCubit.getUserPets();
  }

  static void getPetHistory(
    BuildContext context,
    AppointmentHistoryProvider provider,
  ) {
    debugPrint('Fetching pet history for pet id: ${provider.selectedPet!.id}');
    final AppointmentHistoryCubit appointmentHistoryCubit = context
        .read<AppointmentHistoryCubit>();
    appointmentHistoryCubit.getAppointmentHistory(
      petId: provider.selectedPet!.id,
    );
  }

  static String fetchLeadingImage(String reason) {
    switch (reason) {
      case 'audio_call':
        return 'assets/icons/icons8-outgoing-call-48.png';
      case 'Vaccine':
        return 'assets/icons/icons8-syringe-48.png';
      case 'Routine Checkup':
        return 'assets/icons/icons8-veterinary-examination-48.png';
      default:
        return 'assets/icons/icons8-pets-medical-examination-48.png';
    }
  }
}
