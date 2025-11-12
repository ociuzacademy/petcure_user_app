// pet_image_preview.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/update_pet_module/providers/update_pet_provider.dart';

class PetImagePreview extends StatelessWidget {
  const PetImagePreview({super.key, required this.provider});

  final UpdatePetProvider provider;

  @override
  Widget build(BuildContext context) {
    // Check if we have a newly selected image file
    if (provider.imageFile != null) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: FileImage(provider.imageFile!),
              height: 150,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 20),
                onPressed: () {
                  provider.setImageFile(null);
                },
              ),
            ),
          ),
        ],
      );
    }
    // Check if we have pet details and a pet image from the API
    else if (provider.petDetails != null &&
        provider.petDetails!.pet.petImage.isNotEmpty) {
      return Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: CachedNetworkImage(
              imageUrl:
                  '${AppUrls.baseUrl}${provider.petDetails!.pet.petImage}',
              height: 150,
              width: 150,
              fit: BoxFit.cover,
              placeholder: (context, url) => const SizedBox(
                height: 150,
                width: 150,
                child: Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 150,
                width: 150,
                color: Colors.grey[300],
                child: const Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          // Optionally add a remove button for the existing image too
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white, size: 20),
                onPressed: () {
                  provider.removeImageFile();
                },
              ),
            ),
          ),
        ],
      );
    }
    // No image available
    else {
      return const SizedBox.shrink();
    }
  }
}
