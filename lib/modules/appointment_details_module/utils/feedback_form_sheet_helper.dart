import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_details_module/classes/feedback_data.dart';
import 'package:petcure_user_app/widgets/snackbars/custom_snack_bar.dart';

class FeedbackFormSheetHelper {
  final BuildContext context;

  const FeedbackFormSheetHelper({required this.context});

  void submitFeedback(FeedbackData? feedbackData) {
    if (feedbackData == null) {
      CustomSnackBar.showError(context, message: 'Please fill all the fields');
      return;
    } else {
      final FeedbackBloc feedbackBloc = context.read<FeedbackBloc>();
      feedbackBloc.add(FeedbackEvent.submittingFeedback(feedbackData));
    }
  }
}
