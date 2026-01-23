import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class NextVaccineWidgetHelper {
  final BuildContext context;
  final int petId;
  const NextVaccineWidgetHelper({required this.context, required this.petId});

  void petNextVaccineFetch() {
    final NextVaccineCubit nextVaccineCubit = context.read<NextVaccineCubit>();
    nextVaccineCubit.fetchNextVaccine(petId);
  }
}
