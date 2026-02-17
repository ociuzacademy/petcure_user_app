import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class PrescriptionDetailsHelper {
  final BuildContext context;
  final int prescriptionId;

  const PrescriptionDetailsHelper({
    required this.context,
    required this.prescriptionId,
  });

  void getPrescriptionDetails() {
    final cubit = context.read<PrescriptionDetailsCubit>();
    cubit.getPrescriptionDetails(prescriptionId: prescriptionId);
  }
}
