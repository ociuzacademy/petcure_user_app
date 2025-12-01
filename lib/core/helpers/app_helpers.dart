import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/age.dart';
import 'package:petcure_user_app/core/models/slot_model.dart';

class AppHelpers {
  static double formatDate(DateTime date) {
    final Age age = calculateAge(date);
    return formatAge(age.ageInYears, age.ageInMonths);
  }

  static Age calculateAge(DateTime birthDate) {
    final DateTime currentDate = DateTime.now();

    // Calculate the difference in years
    int years = currentDate.year - birthDate.year;

    // Calculate the difference in months
    int months = currentDate.month - birthDate.month;

    // Adjust if the current month is before the birth month
    if (months < 0) {
      years--;
      months += 12;
    }

    // Adjust if the current day is before the birth day
    if (currentDate.day < birthDate.day) {
      months--;
      if (months < 0) {
        years--;
        months = 11;
      }
    }

    return Age(ageInYears: years, ageInMonths: months);
  }

  static double formatAge(int ageInYears, int ageInMonths) {
    return double.parse((ageInYears + ageInMonths / 12).toString());
  }

  // Category and subcategory mappings
  static const Map<String, List<String>> petCategories = {
    'Animal': ['Dog', 'Cat', 'Rabbit', 'Cow', 'Goat', 'Others'],
    'Bird': ['Parrot', 'Chicken', 'Duck', 'Quail', 'Lovebird', 'Others'],
    'Reptile': ['Snake', 'Lizard', 'Turtle', 'Tortoise', 'Iguana', 'Others'],
    'Amphibian': ['Frog', 'Toad', 'Salamander', 'Others'],
  };

  static List<SlotModel> generateTimeSlots() {
    final List<SlotModel> slots = [];

    // Convert start and end times to minutes since midnight
    const int startMinutes = 9 * 60; // 09:00 AM
    const int endMinutes = 16 * 60; // 04:00 PM (16:00)

    // Generate slots in 30-minute intervals
    for (int minutes = startMinutes; minutes < endMinutes; minutes += 30) {
      final TimeOfDay startTime = TimeOfDay(
        hour: minutes ~/ 60,
        minute: minutes % 60,
      );

      final TimeOfDay endTime = TimeOfDay(
        hour: (minutes + 30) ~/ 60,
        minute: (minutes + 30) % 60,
      );

      slots.add(SlotModel(startingTime: startTime, endingTime: endTime));
    }

    return slots;
  }

  static String formatTimeOfDayTo12Hour(TimeOfDay time) {
    // Convert hour to 12-hour format
    int hour = time.hour % 12;
    if (hour == 0) hour = 12; // Handle 0 (midnight) as 12

    // Format minute with leading zero if needed
    String minute = time.minute.toString().padLeft(2, '0');

    // Determine AM/PM
    String period = time.hour < 12 ? 'AM' : 'PM';

    return '$hour:$minute $period';
  }

  static TimeOfDay parseTimeString(String timeString) {
    List<String> parts = timeString.split(':');
    if (parts.length != 2) {
      throw FormatException('Invalid time format: $timeString');
    }
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    return TimeOfDay(hour: hour, minute: minute);
  }
}
