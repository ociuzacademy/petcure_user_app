// update_pet_helper.dart (optional - if you want to keep some helper methods)
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/update_pet_module/class/update_pet_details.dart';

class UpdatePetHelper {
  static void petDetailsInit(BuildContext context, int petId) {
    final PetDetailsCubit petDetailsCubit = context.read<PetDetailsCubit>();
    petDetailsCubit.getPetDetails(petId);
  }

  static void updatePetDetails(
    BuildContext context,
    int petId,
    UpdatePetDetails petDetails,
  ) {
    final UpdatePetDetailsBloc updatePetDetailsBloc = context
        .read<UpdatePetDetailsBloc>();
    updatePetDetailsBloc.add(
      UpdatePetDetailsEvent.updatingPetDetails(petId, petDetails),
    );
  }
}
