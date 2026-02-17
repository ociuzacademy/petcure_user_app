import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class PrescriptionsHelper {
  final BuildContext context;

  const PrescriptionsHelper({required this.context});

  void getPrescriptions() {
    final cubit = context.read<PrescriptionsCubit>();
    cubit.getPrescriptions();
  }
}
