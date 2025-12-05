import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/complaint_data.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class ComplaintFormSheetHelper {
  final BuildContext context;

  const ComplaintFormSheetHelper({required this.context});

  void submitComplaint(ComplaintData? complaintData) {
    if (complaintData == null) {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
      return;
    } else {
      final ComplaintBloc complaintBloc = context.read<ComplaintBloc>();
      complaintBloc.add(ComplaintEvent.submittingComplaint(complaintData));
    }
  }
}
