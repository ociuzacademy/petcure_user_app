import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';

class PrescriptionDetailsDoctorCard extends StatelessWidget {
  const PrescriptionDetailsDoctorCard({super.key, required this.doctor});

  final DoctorDetails doctor;

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
        leading: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue[50],
          ),
          child: doctor.image != null && doctor.image!.isNotEmpty
              ? ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: '${AppUrls.baseUrl}${doctor.image}',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.person),
                  ),
                )
              : const Icon(Icons.person),
        ),
        title: Text(
          doctor.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(doctor.address, maxLines: 1, overflow: TextOverflow.ellipsis),
            Text(doctor.phone),
          ],
        ),
      ),
    );
  }
}
