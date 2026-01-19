// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/enums/payment_purpose.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';

import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/utils/appointment_booking_helper.dart';
import 'package:petcure_user_app/modules/home_module/models/nearby_doctors_model.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/core/enums/booking_option.dart';
import 'package:petcure_user_app/core/enums/booking_reason.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/provider/appointment_booking_provider.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/reason_dropdown.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/slots_grid.dart';

class AppointmentBookingPage extends StatefulWidget {
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
  State<AppointmentBookingPage> createState() => _AppointmentBookingPageState();
}

class _AppointmentBookingPageState extends State<AppointmentBookingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppointmentBookingHelper.getSlots(
        context,
        widget.doctor.id,
        DateTime.now(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) =>
          AppointmentBookingProvider(context, widget.pet, widget.doctor),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.doctor.fullName)),
        body: BlocListener<AppointmentBookingBloc, AppointmentBookingState>(
          listener: (context, state) {
            switch (state) {
              case AppointmentBookingLoading():
                OverlayLoader.show(context, message: 'Booking Appointment...');
                break;
              case AppointmentBookingSuccess(:final response):
                OverlayLoader.hide();
                CustomSnackBar.showSuccess(context, message: response.message);
                Navigator.pushAndRemoveUntil(
                  context,
                  PaymentPage.route(
                    appointmentId: response.data.id,
                    paymentPurpose: PaymentPurpose.appointment,
                    totalRate: '100.00',
                  ),
                  (route) => false,
                );
                break;
              case AppointmentBookingError(:final error):
                OverlayLoader.hide();
                CustomSnackBar.showError(context, message: error);
                break;
              default:
                OverlayLoader.hide();
                break;
            }
          },
          child: SafeArea(
            child: Padding(
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
                                text: widget.pet.categoryName,
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
                                text: widget.pet.subCategoryName,
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

                        // Date, Reason, and Slot Selection (Now common for both)
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
                            AppointmentBookingHelper.getSlots(
                              context,
                              widget.doctor.id,
                              date,
                            );
                          },
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 7)),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                        if (provider.selectedBookingOption !=
                            BookingOption.audioCall)
                          SizedBox(
                            child: Column(
                              children: [
                                Text(
                                  'Select Reason:',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.045,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: screenSize.height * 0.015),
                                ReasonDropdown(
                                  reasons: BookingReason.values,
                                  selectedReason: provider.selectedReason,
                                  onSelectingReason: (value) {
                                    if (value != null) {
                                      provider.selectReason(value);
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        SizedBox(height: screenSize.height * 0.015),
                        Row(
                          children: [
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  text: 'Doctor Contact: ',
                                  style: TextStyle(
                                    fontSize: screenSize.width * 0.045,
                                    color: AppPalette.blackColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: widget.doctor.phoneNumber,
                                      style: TextStyle(
                                        fontSize: screenSize.width * 0.045,
                                        color: AppPalette.blackColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                final url = 'tel:${widget.doctor.phoneNumber}';
                                if (await canLaunchUrlString(url)) {
                                  await launchUrlString(url);
                                } else {
                                  if (context.mounted) {
                                    CustomSnackBar.showError(
                                      context,
                                      message: 'Could not launch phone dialer',
                                    );
                                  }
                                }
                              },
                              icon: const Icon(
                                Icons.phone,
                                color: AppPalette.firstColor,
                              ),
                            ),
                          ],
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
                          child: BlocBuilder<SlotsCubit, SlotsState>(
                            builder: (context, state) {
                              switch (state) {
                                case SlotsLoading _:
                                  return const CustomLoadingWidget(
                                    message: 'Loading Slots',
                                  );
                                case SlotsError(:final message):
                                  return CustomErrorWidget(
                                    onRetry: () {
                                      AppointmentBookingHelper.getSlots(
                                        context,
                                        widget.doctor.id,
                                        provider.selectedDate!,
                                      );
                                    },
                                    errorMessage: message,
                                  );
                                case SlotsSuccess(:final slots):
                                  return SlotsGrid(
                                    doctor: widget.doctor,
                                    slots: slots.slots,
                                    selectedSlot: provider.selectedTimeSlot,
                                  );
                                default:
                                  return const SizedBox();
                              }
                            },
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),

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
                          onClick: () =>
                              AppointmentBookingHelper.showBookAppointmentDialogueBox(
                                context,
                                provider,
                              ),
                        ),
                        SizedBox(height: screenSize.height * 0.02),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
