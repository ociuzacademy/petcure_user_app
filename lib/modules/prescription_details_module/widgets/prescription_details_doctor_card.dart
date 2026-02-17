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
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: CachedNetworkImageProvider(
            '${AppUrls.baseUrl}${doctor.image}',
          ),
          backgroundColor: Colors.blue[50],
          child: doctor.image.isEmpty ? const Icon(Icons.person) : null,
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
