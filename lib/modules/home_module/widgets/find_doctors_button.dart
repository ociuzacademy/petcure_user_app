// doctor_booking_widget.dart

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:provider/provider.dart';

class FindDoctorsButton extends StatelessWidget {
  const FindDoctorsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorBookingProvider>();

    return SliverToBoxAdapter(
      child: CustomButton(
        buttonWidth: double.infinity,
        backgroundColor: AppPalette.firstColor,
        textColor: Colors.white,
        labelText: 'Find Doctors',
        onClick: () => provider.findDoctors(context),
      ),
    );
  }
}
