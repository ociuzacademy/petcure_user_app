import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

class FeedbacksAndComplaintsHelper {
  final BuildContext context;
  FeedbacksAndComplaintsHelper({required this.context});

  void getUserFeedbacks() {
    final FeedbacksCubit feedbacksCubit = context.read<FeedbacksCubit>();
    feedbacksCubit.getUserFeedbacks();
  }

  void getUserComplaints() {
    final ComplaintsCubit complaintsCubit = context.read<ComplaintsCubit>();
    complaintsCubit.getUserComplaints();
  }
}
