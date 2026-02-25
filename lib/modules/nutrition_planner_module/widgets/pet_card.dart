import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/utils/app_utils.dart';
import 'package:petcure_user_app/core/models/api_models/user_pets_model.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';

class PetCard extends StatelessWidget {
  final Pet pet;
  final VoidCallback onTap;
  const PetCard({super.key, required this.pet, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        onTap: onTap,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: '${AppUrls.baseUrl}${pet.petImage}',
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const CircleAvatar(
              backgroundColor: AppPalette.secondColor,
              child: Icon(Icons.pets, color: AppPalette.firstColor),
            ),
          ),
        ),
        title: Text(
          pet.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${pet.categoryName} • ${pet.subCategoryName}'),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  pet.gender == 'Male' ? Icons.male : Icons.female,
                  size: 16,
                  color: pet.gender == 'Male' ? Colors.blue : Colors.pink,
                ),
                const SizedBox(width: 4),
                Text(
                  '${AppUtils.formatDate(pet.birthDate).toStringAsFixed(1)} yrs • ${pet.weight} kg',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        trailing: const Icon(Icons.chevron_right, color: AppPalette.firstColor),
      ),
    );
  }
}
