import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/helpers/fake_data.dart';
import 'package:petcure_user_app/core/models/pet.dart';
import 'package:petcure_user_app/core/models/booking.dart';
import 'package:petcure_user_app/modules/appointment_history_module/utils/appointment_history_helper.dart';
import 'package:petcure_user_app/widgets/dropdowns/pets_dropdown.dart';

class AppointmentHistoryPage extends StatefulWidget {
  const AppointmentHistoryPage({super.key});

  @override
  State<AppointmentHistoryPage> createState() => _AppointmentHistoryPageState();

  static route() =>
      MaterialPageRoute(builder: (context) => AppointmentHistoryPage());
}

class _AppointmentHistoryPageState extends State<AppointmentHistoryPage> {
  late final AppointmentHistoryHelper _appointmentHistoryHelper;
  late final List<Pet> _pets;
  final ValueNotifier<Pet?> _selectedPet = ValueNotifier(null);
  final ValueNotifier<bool> _showHistory = ValueNotifier(false);
  final ValueNotifier<List<Booking>> _bookingHistory = ValueNotifier([]);

  @override
  void initState() {
    super.initState();
    _appointmentHistoryHelper = AppointmentHistoryHelper(
      context: context,
      selectedPet: _selectedPet,
      showHistory: _showHistory,
      bookingHistory: _bookingHistory,
    );
    _pets = FakeData.generateFakePets();
    // Set the first pet as selected by default
    if (_pets.isNotEmpty) {
      _selectedPet.value = _pets.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Booking History')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: const Text(
                'Select Child:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 8)),
            ValueListenableBuilder(
              valueListenable: _selectedPet,
              builder: (context, selectedPet, child) {
                return SliverToBoxAdapter(
                  child: PetsDropdown(
                    selectedPet: selectedPet,
                    pets: _pets,
                    onSelectingPet: (pet) {
                      _selectedPet.value = pet;
                      _showHistory.value = false;
                    },
                  ),
                );
              },
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _appointmentHistoryHelper.getChildVaccineHistory,
                  child: const Text('Get History'),
                ),
              ),
            ),
            SliverToBoxAdapter(child: const SizedBox(height: 16)),

            // Display booking history only when a child is selected and showHistory is true
            ValueListenableBuilder(
              valueListenable: _showHistory,
              builder: (context, showHistory, _) {
                return ValueListenableBuilder(
                  valueListenable: _selectedPet,
                  builder: (context, selectedPet, _) {
                    if (!showHistory || selectedPet == null) {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    } else {
                      return SliverToBoxAdapter(
                        child: Text(
                          'Booking History: ${selectedPet.name}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                  },
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: _showHistory,
              builder: (context, showHistory, _) {
                if (!showHistory) {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                } else {
                  return const SliverToBoxAdapter(child: SizedBox(height: 10));
                }
              },
            ),
            ValueListenableBuilder(
              valueListenable: _showHistory,
              builder: (context, showHistory, _) {
                return ValueListenableBuilder(
                  valueListenable: _bookingHistory,
                  builder: (context, bookingHistory, child) {
                    if (!showHistory) {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    } else {
                      return SliverList.builder(
                        itemCount: bookingHistory.length,
                        itemBuilder: (context, index) {
                          var booking = bookingHistory[index];
                          return Card(
                            child: ListTile(
                              leading: Image.asset(
                                _appointmentHistoryHelper.fetchLeadingImage(
                                  booking.reasonForBooking,
                                ),
                                width: 40,
                                height: 40,
                              ),
                              title: Text(
                                '${booking.doctor.name} - ${DateFormat('dd-MM-yyyy').format(booking.bookingDate)}',
                              ),
                              subtitle: Text(
                                "${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot.startingTime)} - ${AppHelpers.formatTimeOfDayTo12Hour(booking.timeSlot.endingTime)}",
                              ),
                              trailing: Text(booking.reasonForBooking),
                            ),
                          );
                        },
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
