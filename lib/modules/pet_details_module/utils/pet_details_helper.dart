// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class PetDetailsHelper {
  final BuildContext context;
  final int petId;
  const PetDetailsHelper({required this.context, required this.petId});

  void petDetailsInit() {
    final PetDetailsCubit petDetailsCubit = context.read<PetDetailsCubit>();
    petDetailsCubit.getPetDetails(petId);
  }

  void showDeletePetDialog() {
    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Delete Pet',
      message: 'Are you sure you want to delete this pet?',
      onSubmit: () {
        final DeletePetBloc deletePetBloc = context.read<DeletePetBloc>();
        deletePetBloc.add(DeletePetEvent.deletePet(petId: petId));
      },
    );
  }
}
