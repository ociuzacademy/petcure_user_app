// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/utils/app_utils.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/appointment_booking_module/model/slots_model.dart';

class SlotWidget extends StatelessWidget {
  final Slot slot;
  final bool availability;
  final bool isSelected;
  final VoidCallback onSelect;
  const SlotWidget({
    super.key,
    required this.slot,
    required this.availability,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final String slotTimeRange =
        '${AppUtils.formatTimeOfDayTo12Hour(AppUtils.parseTimeString(slot.startTime))} - ${AppUtils.formatTimeOfDayTo12Hour(AppUtils.parseTimeString(slot.endTime))}';
    return GestureDetector(
      onTap: availability ? onSelect : null,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppPalette.firstColor
              : availability
              ? AppPalette.secondColor
              : AppPalette.grey200Color,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: availability ? AppPalette.firstColor : AppPalette.greyColor,
          ),
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Text(
          slotTimeRange,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: isSelected
                ? AppPalette.whiteColor
                : availability
                ? AppPalette.blackColor
                : AppPalette.greyColor,
          ),
        ),
      ),
    );
  }
}
