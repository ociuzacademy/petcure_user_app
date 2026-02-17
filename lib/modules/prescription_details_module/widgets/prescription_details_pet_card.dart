import 'package:flutter/material.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';

class PrescriptionDetailsPetCard extends StatelessWidget {
  const PrescriptionDetailsPetCard({super.key, required this.pet});

  final PetDetails pet;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            pet.image,
            width: 56,
            height: 56,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.pets),
            ),
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('${pet.category} | ${pet.gender} | ${pet.age}'),
      ),
    );
  }
}
