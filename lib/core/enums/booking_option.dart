// ignore_for_file: public_member_api_docs, sort_constructors_first

enum BookingOption {
  clinicalAppointment('clinical'),
  audioCall('audio_call');

  final String label;

  const BookingOption(this.label);
  String toJson() => label;

  static BookingOption fromString(String value) {
    return BookingOption.values.firstWhere(
      (option) => option.label == value,
      orElse: () => throw ArgumentError('Unknown BookingOption value: $value'),
    );
  }
}
