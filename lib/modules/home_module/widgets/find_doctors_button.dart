// ignore_for_file: public_member_api_docs, sort_constructors_first
// doctor_booking_widget.dart

import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';

class FindDoctorsButton extends StatelessWidget {
  final VoidCallback onClickingFindButton;
  const FindDoctorsButton({super.key, required this.onClickingFindButton});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: CustomButton(
        buttonWidth: double.infinity,
        backgroundColor: AppPalette.firstColor,
        textColor: Colors.white,
        labelText: 'Find Doctors',
        onClick: onClickingFindButton,
      ),
    );
  }
}
