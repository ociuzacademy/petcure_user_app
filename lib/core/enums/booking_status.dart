enum BookingStatus {
  booked('booked'),
  paymentCompleted('payment_completed'),
  completed('completed'),
  cancelled('cancelled');

  final String label;
  const BookingStatus(this.label);

  String toJson() => label;

  static BookingStatus fromString(String value) {
    return BookingStatus.values.firstWhere(
      (option) => option.label == value,
      orElse: () => throw ArgumentError('Unknown BookingStatus value: $value'),
    );
  }
}
