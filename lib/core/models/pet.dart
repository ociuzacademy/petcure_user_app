// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pet {
  final String petId;
  final String ownerId;
  final String name;
  final DateTime birthDate;
  final String category;
  final String subCategory;
  final String photoUrl;
  final double weight; // in kg
  final String gender;
  final String? healthConditions;
  const Pet({
    required this.petId,
    required this.ownerId,
    required this.name,
    required this.birthDate,
    required this.category,
    required this.subCategory,
    required this.photoUrl,
    required this.weight,
    required this.gender,
    this.healthConditions,
  });

  Pet copyWith({
    String? petId,
    String? ownerId,
    String? name,
    DateTime? birthDate,
    String? category,
    String? subCategory,
    String? photoUrl,
    double? weight,
    String? gender,
    String? healthConditions,
  }) {
    return Pet(
      petId: petId ?? this.petId,
      ownerId: ownerId ?? this.ownerId,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      photoUrl: photoUrl ?? this.photoUrl,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      healthConditions: healthConditions ?? this.healthConditions,
    );
  }
}
