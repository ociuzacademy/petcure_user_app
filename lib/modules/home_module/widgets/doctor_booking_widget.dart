import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/view/appointment_booking_page.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/modules/home_module/utils/doctor_booking_widget_helper.dart';
import 'package:petcure_user_app/widgets/buttons/custom_button.dart';
import 'package:petcure_user_app/widgets/dropdowns/pets_dropdown.dart';
import 'package:petcure_user_app/widgets/text_fields/normal_text_field.dart';

class DoctorBookingWidget extends StatefulWidget {
  const DoctorBookingWidget({super.key});

  @override
  State<DoctorBookingWidget> createState() => _DoctorBookingWidgetState();
}

class _DoctorBookingWidgetState extends State<DoctorBookingWidget> {
  late final DoctorBookingWidgetHelper _doctorBookingWidgetHelper;
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();
  final ValueNotifier<Pet?> _selectedPet = ValueNotifier(null);
  final ValueNotifier<bool> _showHospitals = ValueNotifier(false);

  late List<Pet> pets;
  late List<Doctor> doctors;

  @override
  void dispose() {
    super.dispose();
    _latitudeController.dispose();
    _longitudeController.dispose();
    _selectedPet.dispose();
    _showHospitals.dispose();
  }

  @override
  void initState() {
    super.initState();
    _doctorBookingWidgetHelper = DoctorBookingWidgetHelper(
      context: context,
      latitudeController: _latitudeController,
      longitudeController: _longitudeController,
      selectedPet: _selectedPet,
      showHospitals: _showHospitals,
    );

    // Generate data once in initState instead of in build method
    pets = FakeData.generateFakePets();
    doctors = FakeData.generateFakeDoctors();

    // Initialize selected pet if pets list is not empty
    if (pets.isNotEmpty) {
      _selectedPet.value = pets.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    // Initialize _selectedChild if it's null and children list is not empty
    if (_selectedPet.value == null && pets.isNotEmpty) {
      _selectedPet.value = pets.first;
    } else if (!pets.any((pet) => pet.petId == _selectedPet.value?.petId)) {
      _selectedPet.value = null; // Reset if it's not in the list
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomScrollView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        slivers: [
          SliverToBoxAdapter(
            child: const Text(
              'Select Pet:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 8)),
          ValueListenableBuilder(
            valueListenable: _selectedPet,
            builder: (context, selectedPet, child) {
              return SliverToBoxAdapter(
                child: pets.isNotEmpty
                    ? PetsDropdown(
                        selectedPet: selectedPet,
                        pets: pets,
                        onSelectingPet: (pet) {
                          _selectedPet.value = pet;
                          _showHospitals.value = false;
                          _latitudeController.text = '';
                          _longitudeController.text = '';
                        },
                      )
                    : const Text("No pets available. Please add a pet first."),
              );
            },
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: Row(
              children: [
                SizedBox(
                  width: screenSize.width * 0.375,
                  child: NormalTextField(
                    labelText: 'Latitude',
                    hintText: 'Latitude',
                    isDisabled: true,
                    textEditingController: _latitudeController,
                    validatorFunction: (_) {
                      return null;
                    },
                  ),
                ),
                SizedBox(width: screenSize.width * 0.02),
                SizedBox(
                  width: screenSize.width * 0.375,
                  child: NormalTextField(
                    labelText: 'Longitude',
                    hintText: 'Longitude',
                    isDisabled: true,
                    textEditingController: _longitudeController,
                    validatorFunction: (_) {
                      return null;
                    },
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
                      icon: Icon(Icons.location_pin, color: Colors.white),
                      onPressed: _doctorBookingWidgetHelper.getCurrentLocation,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: CustomButton(
              buttonWidth: double.infinity,
              backgroundColor: AppPalette.firstColor,
              textColor: Colors.white,
              labelText: "Find Hospitals",
              onClick: _doctorBookingWidgetHelper.findHospitals,
            ),
          ),
          SliverToBoxAdapter(child: const SizedBox(height: 16)),

          // Replace this BlocBuilder:
          ValueListenableBuilder(
            valueListenable: _selectedPet,
            builder: (context, selectedPet, child) {
              return ValueListenableBuilder(
                valueListenable: _showHospitals,
                builder: (context, showHospitals, child) {
                  if (showHospitals) {
                    return SliverList.list(
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'Available Hospitals:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ...doctors.map(
                          (doctor) => Card(
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: const Icon(
                                Icons.local_hospital,
                                color: Colors.blue,
                              ),
                              title: Text(doctor.name),
                              subtitle: Text(doctor.address),
                              trailing: ElevatedButton(
                                onPressed: () {
                                  pushWithoutNavBar(
                                    context,
                                    AppointmentBookingPage.route(
                                      pet: selectedPet!,
                                      doctor: doctor,
                                    ),
                                  );
                                },
                                child: const Text('Book'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else {
                    return SliverToBoxAdapter(child: SizedBox.shrink());
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
