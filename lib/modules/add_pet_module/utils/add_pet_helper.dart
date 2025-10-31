// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/bloc/pet_operations/pet_operations_bloc.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/modules/add_pet_module/providers/add_pet_form_provider.dart';

class AddPetHelper {
  final BuildContext context;
  final String? userId;
  const AddPetHelper({required this.context, this.userId});

  void addPet() {
    final provider = Provider.of<AddPetFormProvider>(context, listen: false);

    final petDetails = provider.validateForm(context);
    if (petDetails != null) {
      final PetOperationsBloc petOperationsBloc = context
          .read<PetOperationsBloc>();

      petOperationsBloc.add(
        PetOperationsEvent.addingPet(petDetails: petDetails, userId: userId),
      );
    }
  }
}
