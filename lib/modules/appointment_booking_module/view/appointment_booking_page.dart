// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';

import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/utils/appointment_booking_helper.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/reason_dropdown.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/slots_grid.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/select_date_widget.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class AppointmentBookingPage extends StatefulWidget {
  final Pet pet;
  final Doctor doctor;
  const AppointmentBookingPage({
    super.key,
    required this.pet,
    required this.doctor,
  });

  @override
  State<AppointmentBookingPage> createState() => _AppointmentBookingPageState();

  static route({required Pet pet, required Doctor doctor}) => MaterialPageRoute(
    builder: (context) => AppointmentBookingPage(pet: pet, doctor: doctor),
  );
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  late final AppointmentBookingHelper _appointmentBookingHelper;

  final TextEditingController _symptomsController = TextEditingController();

  final ValueNotifier<DateTime?> _selectedDate = ValueNotifier<DateTime?>(null);
  final ValueNotifier<SlotModel?> _selectedTimeSlot = ValueNotifier<SlotModel?>(
    null,
  );
  final ValueNotifier<String?> _selectedReason = ValueNotifier<String?>(null);
  final ValueNotifier<BookingOption> _selectedBookingOption =
      ValueNotifier<BookingOption>(BookingOption.clinicalAppointment);

  @override
  void initState() {
    super.initState();
    _appointmentBookingHelper = AppointmentBookingHelper(
      context: context,
      symptomsController: _symptomsController,
      selectedDate: _selectedDate,
      selectedTimeSlot: _selectedTimeSlot,
      selectedReason: _selectedReason,
      selectedBookingOption: _selectedBookingOption,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _symptomsController.dispose();
    _selectedDate.dispose();
    _selectedTimeSlot.dispose();
    _selectedReason.dispose();
    _selectedBookingOption.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(widget.doctor.name)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.04,
          vertical: 16.0,
        ),
        child: SingleChildScrollView(
          child: ValueListenableBuilder(
            valueListenable: _selectedBookingOption,
            builder: (context, selectedBookingOption, child) {
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
                          text: widget.pet.name,
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
                          text: widget.pet.category,
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
                          text: widget.pet.subCategory,
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
                            style: TextStyle(fontSize: screenSize.width * 0.04),
                          ),
                          value: BookingOption.clinicalAppointment,
                          groupValue: selectedBookingOption,
                          onChanged: (BookingOption? value) {
                            _selectedBookingOption.value = value!;
                          },
                        ),
                        RadioListTile<BookingOption>(
                          title: Text(
                            'Video Conference',
                            style: TextStyle(fontSize: screenSize.width * 0.04),
                          ),
                          value: BookingOption.videoConference,
                          groupValue: selectedBookingOption,
                          onChanged: (BookingOption? value) {
                            _selectedBookingOption.value = value!;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.02),

                  // Clinical Appointment Specific Fields
                  if (selectedBookingOption ==
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
                          ValueListenableBuilder(
                            valueListenable: _selectedDate,
                            builder: (context, selectedDate, child) {
                              return SelectDateWidget(
                                value: selectedDate,
                                onValueChange: (date) {
                                  _selectedDate.value = date;
                                },
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(
                                  const Duration(days: 7),
                                ),
                              );
                            },
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
                          ValueListenableBuilder(
                            valueListenable: _selectedReason,
                            builder: (context, selectedReason, child) {
                              return ReasonDropdown(
                                reasons: AppHelpers.bookingReasons,
                                selectedReason: selectedReason,
                                onSelectingReason: (value) {
                                  _selectedReason.value = value;
                                },
                              );
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
                          // Fixed: Removed Flexible and used ConstrainedBox instead
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxHeight:
                                  screenSize.height * 0.4, // Limit the height
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: _selectedTimeSlot,
                              builder: (context, selectedTimeSlot, child) {
                                return SlotsGrid(
                                  doctor: widget.doctor,
                                  selectedSlot: selectedTimeSlot,
                                  onSelectingSlot: (slot) {
                                    _selectedTimeSlot.value = slot;
                                  },
                                );
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
                    textEditingController: _symptomsController,
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
                    onClick: _appointmentBookingHelper.bookAppointment,
                  ),
                  SizedBox(height: screenSize.height * 0.02),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
