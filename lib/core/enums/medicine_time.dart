enum MedicineTime {
  morning('morning'),
  afternoon('afternoon'),
  evening('evening'),
  night('night');

  final String label;
  const MedicineTime(this.label);

  String toJson() => label;

  static MedicineTime fromString(String value) {
    return MedicineTime.values.firstWhere(
      (option) => option.label == value,
      orElse: () => throw ArgumentError('Unknown MedicineTime value: $value'),
    );
  }
}
