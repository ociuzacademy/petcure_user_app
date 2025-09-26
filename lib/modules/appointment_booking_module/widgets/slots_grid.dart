// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/models/doctor.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/typedefs/select_slot.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/widgets/slot_widget.dart';

class SlotsGrid extends StatefulWidget {
  final Doctor doctor;
  final SlotModel? selectedSlot;
  final SelectSlot onSelectingSlot;
  const SlotsGrid({
    super.key,
    required this.doctor,
    this.selectedSlot,
    this.onSelectingSlot,
  });

  @override
  State<SlotsGrid> createState() => _SlotsGridState();
}

class _SlotsGridState extends State<SlotsGrid> {
  late final List<SlotModel> _slots;
  @override
  void initState() {
    super.initState();
    _slots = AppHelpers.generateTimeSlots();
  }

  @override
  Widget build(BuildContext context) {
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
        SlotModel slot = _slots[index];
        bool isSelected = widget.selectedSlot == slot;

        return SlotWidget(
          slot: slot,
          isSelected: isSelected,
          onSelect: widget.onSelectingSlot,
        );
      },
    );
  }
}
