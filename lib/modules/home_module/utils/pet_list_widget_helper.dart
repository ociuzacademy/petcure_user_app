// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class PetListWidgetHelper {
  final BuildContext context;
  const PetListWidgetHelper({required this.context});

  void userPetsInitialize() {
    final PetsListCubit petsListCubit = context.read<PetsListCubit>();
    petsListCubit.getUserPets();
  }
}
