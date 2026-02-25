// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/utils/app_utils.dart';
import 'package:petcure_user_app/modules/appointment_details_module/view/appointment_details_page.dart';
import 'package:petcure_user_app/modules/appointment_history_module/cubit/appointment_history_cubit.dart';
import 'package:petcure_user_app/modules/appointment_history_module/utils/appointment_history_helper.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/list_item_loading_widget.dart';

import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';
import 'package:petcure_user_app/modules/appointment_history_module/widgets/empty_appointment_history_widget.dart';

class PetAppointmentHistoryListWidget extends StatelessWidget {
  const PetAppointmentHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    if (!provider.showHistory) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return BlocBuilder<AppointmentHistoryCubit, AppointmentHistoryState>(
      builder: (context, state) {
        switch (state) {
          case AppointmentHistoryLoading():
            return const ListItemLoadingWidget(itemCount: 5, useSliver: true);
          case AppointmentHistoryError(error: final error):
            return CustomErrorWidget.sliver(
              onRetry: () {
                AppointmentHistoryHelper.getPetHistory(context, provider);
              },
              errorMessage: error,
            );
          case AppointmentHistorySuccess(
            petAppointmentHistory: final petAppointmentHistory,
          ):
            if (petAppointmentHistory.totalBookings == 0) {
              return const EmptyAppointmentHistoryWidget();
            }
            return SliverList.builder(
              itemCount: petAppointmentHistory.totalBookings,
              itemBuilder: (context, index) {
                final booking = petAppointmentHistory.bookings[index];
                final String startTime = AppUtils.formatTimeOfDayTo12Hour(
                  AppUtils.parseTimeString(booking.slotStart),
                );
                final String endTime = AppUtils.formatTimeOfDayTo12Hour(
                  AppUtils.parseTimeString(booking.slotEnd),
                );
                return Card(
                  child: ListTile(
                    leading: Image.asset(
                      AppointmentHistoryHelper.fetchLeadingImage(
                        booking.appointmentType == BookingOption.audioCall
                            ? booking.appointmentType.label
                            : booking.reason?.label ?? '',
                      ),
                      width: 40,
                      height: 40,
                    ),
                    title: Text(
                      '${booking.doctorName} - ${DateFormat('dd-MM-yyyy').format(booking.date)}',
                    ),
                    subtitle: Text('$startTime - $endTime'),
                    trailing: Text(booking.reason?.label ?? 'No Reason'),
                    onTap: () {
                      Navigator.push(
                        context,
                        AppointmentDetailsPage.route(bookingId: booking.id),
                      );
                    },
                  ),
                );
              },
            );
          default:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );
  }
}
