import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/utils/next_vaccine_widget_helper.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/next_vaccine_success_widget.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class NextVaccineWidget extends StatefulWidget {
  final int petId;
  const NextVaccineWidget({super.key, required this.petId});

  @override
  State<NextVaccineWidget> createState() => _NextVaccineWidgetState();
}

class _NextVaccineWidgetState extends State<NextVaccineWidget> {
  late final NextVaccineWidgetHelper _helper;

  @override
  void initState() {
    super.initState();
    _helper = NextVaccineWidgetHelper(context: context, petId: widget.petId);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper.petNextVaccineFetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NextVaccineCubit, NextVaccineState>(
      builder: (context, state) {
        return switch (state) {
          NextVaccineLoading() => const CustomLoadingWidget.centered(
            message: 'Fetching next vaccine information...',
          ),
          NextVaccineSuccess(vaccineData: final vaccineData) =>
            NextVaccineSuccessWidget(vaccineData: vaccineData),
          NextVaccineError(message: final message) => CustomErrorWidget(
            onRetry: _helper.petNextVaccineFetch,
            errorMessage: message,
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
