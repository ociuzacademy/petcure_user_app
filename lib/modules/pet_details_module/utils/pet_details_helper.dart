// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/cubit/pet_details/pet_details_cubit.dart';

class PetDetailsHelper {
  final BuildContext context;
  final int petId;
  const PetDetailsHelper({required this.context, required this.petId});

  void petDetailsInit() {
    final PetDetailsCubit petDetailsCubit = context.read<PetDetailsCubit>();
    petDetailsCubit.getPetDetails(petId);
  }
}
