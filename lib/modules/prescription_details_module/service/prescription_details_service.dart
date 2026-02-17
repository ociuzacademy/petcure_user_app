import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:petcure_user_app/core/constants/app_constants.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/modules/prescription_details_module/models/prescription_details_model.dart';
import 'package:share_plus/share_plus.dart';

class PrescriptionDetailsService {
  static Future<PrescriptionDetailsModel> getPrescriptionDetails({
    required int prescriptionId,
    required String userId,
  }) async {
    debugPrint('PrescriptionDetailsService: prescriptionId - $prescriptionId');
    try {
      final Map<String, dynamic> params = {
        'prescription_id': prescriptionId.toString(),
        'user_id': userId,
      };

      final url = Uri.parse(
        AppUrls.prescriptionViewUrl,
      ).replace(queryParameters: params);

      final resp = await http
          .get(
            url,
            headers: <String, String>{
              'Content-Type': 'application/x-www-form-urlencoded',
            },
          )
          .timeout(
            const Duration(seconds: AppConstants.requestTimeoutSeconds),
            onTimeout: () {
              throw TimeoutException(
                'Request timed out after ${AppConstants.requestTimeoutSeconds} seconds',
              );
            },
          );

      if (resp.statusCode == 200) {
        final dynamic decoded = jsonDecode(resp.body);
        final response = PrescriptionDetailsModel.fromJson(decoded);

        return response;
      } else {
        final Map<String, dynamic> errorResponse = jsonDecode(resp.body);
        throw Exception(errorResponse['error'] ?? 'Unknown error');
      }
    } on TimeoutException catch (e) {
      debugPrint('PrescriptionDetailsService: Request timeout - $e');
      throw Exception(
        'Request timeout. Please check your internet connection and try again.',
      );
    } on SocketException {
      throw Exception('Server error');
    } on HttpException {
      throw Exception('Something went wrong');
    } on FormatException {
      throw Exception('Bad request');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<void> generateAndSharePrescription(
    PrescriptionDetailsModel prescriptionData,
  ) async {
    final pdf = pw.Document();
    final prescription = prescriptionData.prescription;
    final doctor = prescription.doctorDetails;
    final pet = prescription.petDetails;
    final appointment = prescription.appointmentDetails;

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'PETCURE',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 24,
                    color: PdfColors.blue900,
                  ),
                ),
                pw.Text(
                  'PRESCRIPTION',
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 18,
                    color: PdfColors.grey700,
                  ),
                ),
              ],
            ),
          ),
          pw.SizedBox(height: 20),
          pw.Row(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Doctor Information',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Divider(thickness: 1),
                    pw.Text('Dr. ${doctor.name}'),
                    pw.Text(doctor.email),
                    pw.Text('Ph: ${doctor.phone}'),
                    pw.Text(doctor.address),
                  ],
                ),
              ),
              pw.SizedBox(width: 40),
              pw.Expanded(
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Pet Information',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Divider(thickness: 1),
                    pw.Text('Name: ${pet.name}'),
                    pw.Text('Breed: ${pet.category} - ${pet.subCategory}'),
                    pw.Text('Gender: ${pet.gender}'),
                    pw.Text('Age: ${pet.age}'),
                    pw.Text('Weight: ${pet.weight} kg'),
                  ],
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'Appointment Details',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Divider(thickness: 1),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                'Date: ${DateFormat('dd-MM-yyyy').format(appointment.date)}',
              ),
              pw.Text('Slot: ${appointment.slot}'),
              pw.Text('Type: ${appointment.type.label}'),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text(
            'Diagnosis',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Divider(thickness: 1),
          pw.Text(prescription.diagnosis),
          pw.SizedBox(height: 20),
          pw.Text(
            'Medications',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
          ),
          pw.Divider(thickness: 1),
          pw.TableHelper.fromTextArray(
            headers: [
              'Medication',
              'Dosage',
              'Timing With Food',
              'Time of Day',
            ],
            data: prescription.medications.map((med) {
              return [
                med.name,
                med.dosage,
                med.foodTiming.label,
                med.timeOfDay.map((t) => t.label).join(', '),
              ];
            }).toList(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headerDecoration: const pw.BoxDecoration(color: PdfColors.grey300),
            cellHeight: 30,
            cellAlignments: {
              0: pw.Alignment.centerLeft,
              1: pw.Alignment.center,
              2: pw.Alignment.center,
              3: pw.Alignment.centerLeft,
            },
          ),
          pw.SizedBox(height: 20),
          if (prescription.notes.isNotEmpty) ...[
            pw.Text(
              "Doctor's Notes",
              style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            ),
            pw.Divider(thickness: 1),
            pw.Text(prescription.notes),
            pw.SizedBox(height: 20),
          ],
          pw.Footer(
            trailing: pw.Text(
              'Issued on: ${DateFormat('dd-MM-yyyy').format(prescription.issuedDate)}',
              style: const pw.TextStyle(fontSize: 10),
            ),
          ),
        ],
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/prescription_${prescription.id}.pdf');
    await file.writeAsBytes(await pdf.save());

    await SharePlus.instance.share(
      ShareParams(
        files: [XFile(file.path)],
        text: 'Prescription for ${pet.name} from Dr. ${doctor.name}',
      ),
    );
  }
}
