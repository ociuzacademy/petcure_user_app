// appointment_history_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/modules/appointment_history_module/providers/appointment_history_provider.dart';

class PetAppointmentHistoryListWidget extends StatelessWidget {
  const PetAppointmentHistoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppointmentHistoryProvider>();

    if (!provider.showHistory) {
      return const SliverToBoxAdapter(child: SizedBox.shrink());
    }

    return SliverList.builder(
      itemCount: provider.bookingHistory.length,
      itemBuilder: (context, index) {
        final booking = provider.bookingHistory[index];
        return Card(
          child: ListTile(
            leading: Image.asset(
              provider.fetchLeadingImage(booking.reasonForBooking),
              width: 40,
              height: 40,
            ),
            title: Text(
              '${booking.doctor.name} - ${DateFormat('dd-MM-yyyy').format(booking.bookingDate)}',
            ),
            subtitle: Text(
              '${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot.startingTime)} - ${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot.endingTime)}',
            ),
            trailing: Text(booking.reasonForBooking),
          ),
        );
      },
    );
  }
}
