// ignore_for_file: public_member_api_docs, sort_constructors_first

enum BookingOption {
  clinicalAppointment('clinical'),
  audioCall('audio_call');

  final String value;

  const BookingOption(this.value);
  String toJson() => value;

  static BookingOption fromString(String value) {
    return BookingOption.values.firstWhere(
      (option) => option.value == value,
      orElse: () => throw ArgumentError('Unknown BookingOption value: $value'),
    );
  }
}
