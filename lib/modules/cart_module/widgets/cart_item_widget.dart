// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/cart_module/helper/cart_helper.dart';
import 'package:petcure_user_app/modules/cart_module/models/cart_items_model.dart';
import 'package:petcure_user_app/modules/cart_module/typedefs/update_quantity.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.item,
    required this.index,
    required this.onUpdatingQuantity,
  });
  final CartItem item;
  final int index;
  final UpdateQuantity onUpdatingQuantity;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.productImages.isNotEmpty
                    ? '${AppUrls.baseUrl}${item.productImages[0].image}'
                    : 'https://via.placeholder.com/300',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(Icons.error),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),

            // Product Details and Quantity Controls
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\u{20B9}${double.parse(item.totalPrice) / item.quantity}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppPalette.firstColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Delivery Date
                  Row(
                    children: [
                      Icon(
                        Icons.local_shipping,
                        size: 14,
                        color: Colors.green[600],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Delivery: ${CartHelper.formatDeliveryDate(DateTime.now().add(const Duration(days: 5)))}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Quantity Controls
                  Row(
                    children: [
                      // Decrease Button
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          onUpdatingQuantity(index, item.quantity - 1);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Quantity Display
                      Text(
                        item.quantity.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),

                      // Increase Button
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          onUpdatingQuantity(index, item.quantity + 1);
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey[200],
                        ),
                      ),

                      const Spacer(),

                      // Item Total
                      Text(
                        '\u{20B9}${item.totalPrice}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
