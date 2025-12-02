import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/modules/appointment_details_module/cubit/appointment_details_cubit.dart';

class AppointmentDetailsHelper {
  final BuildContext context;
  final int bookingId;

  const AppointmentDetailsHelper({
    required this.context,
    required this.bookingId,
  });

  void appointmentDetailsInit() {
    final AppointmentDetailsCubit cubit = context
        .read<AppointmentDetailsCubit>();
    cubit.getAppointmentDetails(bookingId);
  }

  static String formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final weekday = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    return '${weekday[date.weekday - 1]}, ${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
