// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/helpers/app_helpers.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';

class SlotWidget extends StatelessWidget {
  final SlotModel slot;
  final bool isSelected;
  final Function(SlotModel)? onSelect;
  const SlotWidget({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final String slotTimeRange =
        "${AppHelpers.formatTimeOfDayTo12Hour(slot.startingTime)} - ${AppHelpers.formatTimeOfDayTo12Hour(slot.endingTime)}";
    return GestureDetector(
      onTap: () {
        if (onSelect != null) {
          onSelect!(slot);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? AppPalette.firstColor : AppPalette.secondColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppPalette.firstColor),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          slotTimeRange,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected ? AppPalette.whiteColor : AppPalette.blackColor,
          ),
        ),
      ),
    );
  }
}
