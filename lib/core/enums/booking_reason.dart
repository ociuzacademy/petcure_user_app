enum BookingReason {
  vaccine('Vaccine'),
  routineCheckup('Routine Checkup'),
  sickness('Sickness');

  final String label;
  const BookingReason(this.label);
}
