// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:petcure_user_app/modules/appointment_booking_module/model/slots_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/provider/appointment_booking_provider.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/slot_widget.dart';
import 'package:petcure_user_app/modules/home_module/models/nearby_doctors_model.dart';
import 'package:provider/provider.dart';

class SlotsGrid extends StatefulWidget {
  final Doctor doctor;
  final List<Slot> slots;
  final Slot? selectedSlot;
  const SlotsGrid({
    super.key,
    required this.doctor,
    required this.slots,
    this.selectedSlot,
  });

  @override
  State<SlotsGrid> createState() => _SlotsGridState();
}

class _SlotsGridState extends State<SlotsGrid> {
  late final List<Slot> _slots;
  @override
  void initState() {
    super.initState();
    _slots = widget.slots;
  }

  @override
  Widget build(BuildContext context) {
    final AppointmentBookingProvider provider =
        Provider.of<AppointmentBookingProvider>(context, listen: false);
    return GridView.builder(
      shrinkWrap: true, // Add this
      physics: const NeverScrollableScrollPhysics(), // Add this
      itemCount: _slots.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Two columns
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2, // Adjust height
      ),
      itemBuilder: (context, index) {
        Slot slot = _slots[index];
        bool isSelected = widget.selectedSlot == slot;

        return SlotWidget(
          slot: slot,
          availability: slot.availability,
          isSelected: isSelected,
          onSelect: () =>
              slot.availability ? provider.selectTimeSlot(slot) : null,
        );
      },
    );
  }
}
