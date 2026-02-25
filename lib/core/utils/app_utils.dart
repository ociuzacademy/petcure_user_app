import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/age.dart';
import 'package:petcure_user_app/core/models/place_model.dart';

class AppUtils {
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

  /// Checks if the current time is within the appointment slot on today's date
  /// Returns true only if:
  /// 1. The appointment date is today
  /// 2. Current time is between slotStart and slotEnd
  static bool isWithinAppointmentSlot({
    required DateTime appointmentDate,
    required String slotStart,
    required String slotEnd,
  }) {
    final now = DateTime.now();

    // Check if appointment is today
    final isToday =
        appointmentDate.year == now.year &&
        appointmentDate.month == now.month &&
        appointmentDate.day == now.day;

    if (!isToday) return false;

    // Parse slot times
    final startTime = parseTimeString(slotStart);
    final endTime = parseTimeString(slotEnd);

    // Convert current time to minutes since midnight
    final currentMinutes = now.hour * 60 + now.minute;

    // Convert slot times to minutes since midnight
    final startMinutes = startTime.hour * 60 + startTime.minute;
    final endMinutes = endTime.hour * 60 + endTime.minute;

    // Check if current time is within the slot
    return currentMinutes >= startMinutes && currentMinutes <= endMinutes;
  }

  static List<PlaceModel> getPlaces() {
    return [
      PlaceModel(placeValue: 'thrissur', displayName: 'Thrissur'),
      PlaceModel(placeValue: 'kunnamkulam', displayName: 'Kunnamkulam'),
      PlaceModel(placeValue: 'chalakkudy', displayName: 'Chalakkudy'),
      PlaceModel(placeValue: 'kodungallur', displayName: 'Kodungallur'),
      PlaceModel(placeValue: 'guruvayur', displayName: 'Guruvayur'),
      PlaceModel(placeValue: 'iriyur', displayName: 'Iriyur'),
      PlaceModel(placeValue: 'cholapuram', displayName: 'Cholapuram'),
      PlaceModel(placeValue: 'elavally', displayName: 'Elavally'),
      PlaceModel(placeValue: 'karumathra', displayName: 'Karumathra'),
      PlaceModel(placeValue: 'kattakampal', displayName: 'Kattakampal'),
      PlaceModel(placeValue: 'manalur', displayName: 'Manalur'),
      PlaceModel(placeValue: 'minalur', displayName: 'Minalur'),
      PlaceModel(placeValue: 'mullassery', displayName: 'Mullassery'),
      PlaceModel(placeValue: 'nadathara', displayName: 'Nadathara'),
      PlaceModel(placeValue: 'naduvil', displayName: 'Naduvil'),
      PlaceModel(placeValue: 'nellayi', displayName: 'Nellayi'),
      PlaceModel(placeValue: 'ollur', displayName: 'Ollur'),
      PlaceModel(placeValue: 'panamkutty', displayName: 'Panamkutty'),
      PlaceModel(placeValue: 'pandipulam', displayName: 'Pandipulam'),
      PlaceModel(placeValue: 'parappukkara', displayName: 'Parappukkara'),
      PlaceModel(placeValue: 'perakam', displayName: 'Perakam'),
      PlaceModel(placeValue: 'perumannur', displayName: 'Perumannur'),
      PlaceModel(placeValue: 'pullazhi', displayName: 'Pullazhi'),
      PlaceModel(placeValue: 'puthenchira', displayName: 'Puthenchira'),
      PlaceModel(placeValue: 'puthenpeedika', displayName: 'Puthenpeedika'),
      PlaceModel(placeValue: 'thangalur', displayName: 'Thangalur'),
      PlaceModel(placeValue: 'thayyur', displayName: 'Thayyur'),
      PlaceModel(placeValue: 'thiruvilwamala', displayName: 'Thiruvilwamala'),
      PlaceModel(placeValue: 'thozhiyur', displayName: 'Thozhiyur'),
      PlaceModel(placeValue: 'velur', displayName: 'Velur'),
      PlaceModel(placeValue: 'venmanad', displayName: 'Venmanad'),
    ];
  }
}
