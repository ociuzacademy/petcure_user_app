// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class UpdatePetDetails {
  final String? petName;
  final DateTime? birthDate;
  final String? gender;
  final double? weight;
  final String? healthCondition;
  final File? petImage;
  const UpdatePetDetails({
    this.petName,
    this.birthDate,
    this.gender,
    this.weight,
    this.healthCondition,
    this.petImage,
  });

  /// Returns true if any property is null.
  bool isAnyNull() =>
      petName == null ||
      birthDate == null ||
      gender == null ||
      weight == null ||
      healthCondition == null ||
      petImage == null;

  /// Returns true only if all properties are null.
  bool isAllNull() =>
      petName == null &&
      birthDate == null &&
      gender == null &&
      weight == null &&
      healthCondition == null &&
      petImage == null;

  /// Returns true when none of the properties are null.
  bool isComplete() =>
      petName != null &&
      birthDate != null &&
      gender != null &&
      weight != null &&
      healthCondition != null &&
      petImage != null;

  @Deprecated(
    'Use isAnyNull() instead. This will be removed in a future release.',
  )
  bool isNull() => isAnyNull();
}
