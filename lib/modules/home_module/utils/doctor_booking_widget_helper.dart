// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/cubit/pets_list/pets_list_cubit.dart';

class DoctorBookingWidgetHelper {
  final BuildContext context;
  const DoctorBookingWidgetHelper({required this.context});

  void petsListInit() {
    final PetsListCubit petsListCubit = context.read<PetsListCubit>();
    petsListCubit.getUserPets();
  }
}
