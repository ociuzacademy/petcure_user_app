// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class AddPetDetails {
  final String name;
  final DateTime birthDate;
  final String gender;
  final int categoryid;
  final int subCategoryId;
  final double weight;
  final String? healthCondition;
  final File petImage;
  const AddPetDetails({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.categoryid,
    required this.subCategoryId,
    required this.weight,
    this.healthCondition,
    required this.petImage,
  });
}
