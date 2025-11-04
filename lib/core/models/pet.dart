// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pet {
  final int petId;
  final int ownerId;
  final String name;
  final DateTime birthDate;
  final int categoryId;
  final String category;
  final int subCategoryId;
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
    required this.categoryId,
    required this.category,
    required this.subCategoryId,
    required this.subCategory,
    required this.photoUrl,
    required this.weight,
    required this.gender,
    this.healthConditions,
  });

  Pet copyWith({
    int? petId,
    int? ownerId,
    String? name,
    DateTime? birthDate,
    int? categoryId,
    String? category,
    int? subCategoryId,
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
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      subCategoryId: subCategoryId ?? this.subCategoryId,
      subCategory: subCategory ?? this.subCategory,
      photoUrl: photoUrl ?? this.photoUrl,
      weight: weight ?? this.weight,
      gender: gender ?? this.gender,
      healthConditions: healthConditions ?? this.healthConditions,
    );
  }
}
