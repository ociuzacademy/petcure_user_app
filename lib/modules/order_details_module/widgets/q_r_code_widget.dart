// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/core/typedefs/format_date.dart';
import 'package:petcure_user_app/modules/order_details_module/models/order_details_model.dart';
import 'package:petcure_user_app/modules/order_details_module/widgets/info_row.dart';

class QRCodeWidget extends StatelessWidget {
  final int orderId;
  final String qrCodeData;
  final FormatDate formatDeliveryDate;
  final List<Item> items;
  final String totalRate;
  final DateTime estimatedDeliveryDate;
  const QRCodeWidget({
    super.key,
    required this.orderId,
    required this.qrCodeData,
    required this.formatDeliveryDate,
    required this.items,
    required this.totalRate,
    required this.estimatedDeliveryDate,
  });

  @override
  Widget build(BuildContext context) {
    final qrCode = QrCode.fromData(
      data: qrCodeData,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Order QR Code',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // QR Code
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withValues(alpha: 0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 250,
                        height: 250,
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppPalette.blackColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: PrettyQrView(
                          qrImage: QrImage(qrCode),
                          decoration: const PrettyQrDecoration(
                            shape: PrettyQrSmoothSymbol(),
                            background: Colors.white,
                            // color: Colors.black,
                          ),
                          // size: 250,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Order Info
                  Text(
                    'Order ID: #$orderId',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Text(
                    'Scan this QR code for completing the order.',
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // Additional Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        InfoRow(label: 'Items', value: '${items.length}'),
                        const SizedBox(height: 8),
                        InfoRow(label: 'Total', value: '\u{20B9}$totalRate'),
                        const SizedBox(height: 8),
                        InfoRow(
                          label: 'Est. Delivery',
                          value: formatDeliveryDate(estimatedDeliveryDate),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Done'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
