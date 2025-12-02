enum BookingReason {
  vaccine('Vaccine'),
  routineCheckup('Routine Checkup'),
  sickness('Sickness');

  final String label;
  const BookingReason(this.label);

  String toJson() => label;

  static BookingReason fromString(String value) {
    return BookingReason.values.firstWhere(
      (option) => option.label == value,
      orElse: () => throw ArgumentError('Unknown BookingOption value: $value'),
    );
  }
}
