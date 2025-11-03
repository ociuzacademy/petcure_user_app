// doctor_booking_widget.dart

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/home_module/providers/doctor_booking_providers.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';
import 'package:provider/provider.dart';

class LocationInputWidget extends StatelessWidget {
  const LocationInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DoctorBookingProvider>();
    final screenSize = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Row(
        children: [
          SizedBox(
            width: screenSize.width * 0.375,
            child: NormalTextField(
              labelText: 'Latitude',
              hintText: 'Latitude',
              isDisabled: true,
              textEditingController: provider.latitudeController,
              validatorFunction: (_) => null,
            ),
          ),
          SizedBox(width: screenSize.width * 0.02),
          SizedBox(
            width: screenSize.width * 0.375,
            child: NormalTextField(
              labelText: 'Longitude',
              hintText: 'Longitude',
              isDisabled: true,
              textEditingController: provider.longitudeController,
              validatorFunction: (_) => null,
            ),
          ),
          SizedBox(width: screenSize.width * 0.013),
          Padding(
            padding: const EdgeInsets.only(top: 23.0),
            child: SizedBox(
              width: screenSize.width * 0.135,
              height: screenSize.height * 0.06,
              child: IconButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: AppPalette.firstColor,
                ),
                icon: const Icon(Icons.location_pin, color: Colors.white),
                onPressed: () => provider.getCurrentLocation(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
