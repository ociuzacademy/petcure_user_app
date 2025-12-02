import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_details_module/utils/appointment_detils_helper.dart';
import 'package:petcure_user_app/modules/appointment_details_module/widgets/appointment_details_view.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class AppointmentDetailsPage extends StatefulWidget {
  final int bookingId;
  const AppointmentDetailsPage({super.key, required this.bookingId});

  static route({required int bookingId}) => MaterialPageRoute(
    builder: (context) => AppointmentDetailsPage(bookingId: bookingId),
  );

  @override
  State<AppointmentDetailsPage> createState() => _AppointmentDetailsPageState();
}

class _AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  late final AppointmentDetailsHelper _appointmentDetailsHelper;

  @override
  void initState() {
    super.initState();
    _appointmentDetailsHelper = AppointmentDetailsHelper(
      context: context,
      bookingId: widget.bookingId,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _appointmentDetailsHelper.appointmentDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Details'),
        backgroundColor: AppPalette.firstColor,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<AppointmentDetailsCubit, AppointmentDetailsState>(
        builder: (context, state) {
          switch (state) {
            case AppointmentDetailsLoading _:
              return const CustomLoadingWidget.centered(
                message: 'Loading appointment details...',
              );
            case AppointmentDetailsSuccess(:final data):
              return AppointmentDetailsView(
                bookingId: widget.bookingId,
                appointmentData: data.data,
              );
            case AppointmentDetailsError(:final message):
              return CustomErrorWidget(
                onRetry: _appointmentDetailsHelper.appointmentDetailsInit,
                errorMessage: message,
              );
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
