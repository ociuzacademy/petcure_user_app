import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/classes/appointment_booking_data.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/provider/appointment_booking_provider.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';

class AppointmentBookingHelper {
  static void getSlots(BuildContext context, int doctorId, DateTime date) {
    final SlotsCubit slotsCubit = context.read<SlotsCubit>();
    slotsCubit.getSlots(doctorId: doctorId, date: date);
  }

  static void resetNextVaccineState(BuildContext context) {
    final NextVaccineCubit nextVaccineCubit = context.read<NextVaccineCubit>();
    nextVaccineCubit.resetState();
  }

  static void showBookAppointmentDialogueBox(
    BuildContext context,
    AppointmentBookingProvider provider,
  ) {
    FocusScope.of(context).unfocus();
    if (provider.selectedBookingOption == BookingOption.audioCall &&
        provider.symptomsController.text.isEmpty) {
      CustomSnackBar.showError(context, message: 'Please enter symptoms');
      return;
    }

    if (provider.selectedTimeSlot == null) {
      CustomSnackBar.showError(context, message: 'Please select time slot');
      return;
    }

    if (provider.selectedBookingOption == BookingOption.clinicalAppointment &&
        provider.selectedReason == null) {
      CustomSnackBar.showError(context, message: 'Please select reason');
      return;
    }

    if (provider.selectedDate == null) {
      CustomSnackBar.showError(context, message: 'Please select date');
      return;
    }

    CustomDialogBox.showCustomDialog(
      context: context,
      title: 'Book Appointment',
      message: 'Do you wanted to book this appointment?',
      onSubmit: () {
        _bookAppointment(context, provider.appointmentBookingData!);
      },
    );
  }

  static void _bookAppointment(
    BuildContext context,
    AppointmentBookingData data,
  ) {
    FocusScope.of(context).unfocus();
    final AppointmentBookingBloc appointmentBookingBloc = context
        .read<AppointmentBookingBloc>();
    appointmentBookingBloc.add(
      AppointmentBookingEvent.bookingAppointment(data),
    );
  }
}
