// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:provider/provider.dart';

import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/provider/appointment_booking_provider.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/reason_dropdown.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/slots_grid.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/select_date_widget.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class AppointmentBookingPage extends StatelessWidget {
  final Pet pet;
  final Doctor doctor;
  const AppointmentBookingPage({
    super.key,
    required this.pet,
    required this.doctor,
  });

  static route({required Pet pet, required Doctor doctor}) => MaterialPageRoute(
    builder: (context) => AppointmentBookingPage(pet: pet, doctor: doctor),
  );

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => AppointmentBookingProvider(context),
      child: Scaffold(
        appBar: AppBar(title: Text(doctor.name)),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.04,
            vertical: 16.0,
          ),
          child: SingleChildScrollView(
            child: Consumer<AppointmentBookingProvider>(
              builder: (context, provider, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Pet Name: ',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: AppPalette.blackColor,
                        ),
                        children: [
                          TextSpan(
                            text: pet.name,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: AppPalette.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),
                    RichText(
                      text: TextSpan(
                        text: 'Category: ',
                        style: TextStyle(
                          fontSize: screenSize.width * 0.045,
                          color: AppPalette.blackColor,
                        ),
                        children: [
                          TextSpan(
                            text: pet.category,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: AppPalette.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ', Sub Category: ',
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: AppPalette.blackColor,
                            ),
                          ),
                          TextSpan(
                            text: pet.subCategory,
                            style: TextStyle(
                              fontSize: screenSize.width * 0.045,
                              color: AppPalette.blackColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),
                    Text(
                      'Select Booking Option:',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),
                    SizedBox(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RadioListTile<BookingOption>(
                            title: Text(
                              'Clinical Appointment',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.04,
                              ),
                            ),
                            value: BookingOption.clinicalAppointment,
                            groupValue: provider.selectedBookingOption,
                            onChanged: (BookingOption? value) {
                              if (value != null) {
                                provider.selectBookingOption(value);
                              }
                            },
                          ),
                          RadioListTile<BookingOption>(
                            title: Text(
                              'Audio Call',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.04,
                              ),
                            ),
                            value: BookingOption.audioCall,
                            groupValue: provider.selectedBookingOption,
                            onChanged: (BookingOption? value) {
                              if (value != null) {
                                provider.selectBookingOption(value);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.02),

                    // Clinical Appointment Specific Fields
                    if (provider.selectedBookingOption ==
                        BookingOption.clinicalAppointment)
                      SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Select Date:',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.015),
                            SelectDateWidget(
                              value: provider.selectedDate,
                              onValueChange: (date) {
                                provider.selectDate(date);
                              },
                              firstDate: DateTime.now(),
                              lastDate: DateTime.now().add(
                                const Duration(days: 7),
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Text(
                              'Select Reason:',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.015),
                            ReasonDropdown(
                              reasons: AppHelpers.bookingReasons,
                              selectedReason: provider.selectedReason,
                              onSelectingReason: (value) {
                                if (value != null) {
                                  provider.selectReason(value);
                                }
                              },
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Text(
                              'Select Time Slot:',
                              style: TextStyle(
                                fontSize: screenSize.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.015),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight:
                                    screenSize.height * 0.4, // Limit the height
                              ),
                              child: SlotsGrid(
                                doctor: doctor,
                                selectedSlot: provider.selectedTimeSlot,
                                onSelectingSlot: (slot) {
                                  provider.selectTimeSlot(slot);
                                },
                              ),
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                          ],
                        ),
                      ),

                    // Symptoms Field (common to both booking options)
                    Text(
                      'Enter Symptoms:',
                      style: TextStyle(
                        fontSize: screenSize.width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenSize.height * 0.015),
                    NormalTextField(
                      textEditingController: provider.symptomsController,
                      validatorFunction: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please add symptoms';
                        }
                        return null;
                      },
                      labelText: 'Symptoms',
                      hintText: 'Enter symptoms',
                      isMultiline: true,
                    ),
                    SizedBox(height: screenSize.height * 0.03),

                    // Confirm Booking Button
                    CustomButton(
                      buttonWidth: double.infinity,
                      backgroundColor: AppPalette.firstColor,
                      textColor: AppPalette.whiteColor,
                      labelText: 'Confirm Booking',
                      onClick: provider.bookAppointment,
                    ),
                    SizedBox(height: screenSize.height * 0.02),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
