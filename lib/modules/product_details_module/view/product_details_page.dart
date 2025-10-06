// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/models/product.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';
import 'package:petcure_user_app/modules/product_details_module/utils/product_details_helper.dart';

class ProductDetailsPage extends StatefulWidget {
  final Product product;
  const ProductDetailsPage({super.key, required this.product});

  static route({required Product product}) => MaterialPageRoute(
    builder: (context) => ProductDetailsPage(product: product),
  );

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late final ProductDetailsHelper _productDetailsHelper;
  final ValueNotifier<bool> _addedToCart = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _productDetailsHelper = ProductDetailsHelper(
      addedToCart: _addedToCart,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product.productName),
        backgroundColor: AppPalette.firstColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: screenSize.height * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Image.network(
                widget.product.imageURLs.isNotEmpty
                    ? widget.product.imageURLs[0]
                    : 'https://via.placeholder.com/300',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(
                      Icons.error_outline,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            // Product Details
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.product.productName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Price
                  Text(
                    '\u{20B9}${widget.product.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.firstColor,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Estimated Delivery Date
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green[100]!),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_shipping,
                          size: 16,
                          color: Colors.green[700],
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'Delivery by ${_productDetailsHelper.formattedDeliveryDate}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.green[700],
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '(in ${widget.product.daysToDeliver} ${widget.product.daysToDeliver == 1 ? 'day' : 'days'})',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Category Chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      Chip(
                        label: Text(
                          widget.product.productCategory,
                          style: const TextStyle(fontSize: 14),
                        ),
                        backgroundColor: Colors.green[50],
                      ),
                      Chip(
                        label: Text(
                          widget.product.petCategory,
                          style: const TextStyle(fontSize: 14),
                        ),
                        backgroundColor: Colors.orange[50],
                      ),
                      Chip(
                        label: Text(
                          widget.product.petSubCategory,
                          style: const TextStyle(fontSize: 14),
                        ),
                        backgroundColor: Colors.blue[50],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Quantity
                  Row(
                    children: [
                      const Text(
                        'Quantity: ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.product.quantity,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Delivery Info Section
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.info_outline,
                              size: 18,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Delivery Information',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '• This item will be delivered within ${widget.product.daysToDeliver} ${widget.product.daysToDeliver == 1 ? 'day' : 'days'}\n'
                          '• Free delivery on all orders\n'
                          '• Easy returns within 7 days',
                          style: TextStyle(
                            fontSize: 14,
                            height: 1.4,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Description
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.product.productDescription,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom buttons
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: _addedToCart,
        builder: (context, addedToCart, child) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.5),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: addedToCart
                ? // Expanded Buy Now button after adding to cart
                  ElevatedButton(
                    onPressed: () {
                      // Buy now functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPalette.firstColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : // Original two buttons before adding to cart
                  Row(
                    children: [
                      // Add to Cart Button
                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: _productDetailsHelper.addToCart,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppPalette.firstColor,
                            side: BorderSide(color: AppPalette.firstColor),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          icon: const Icon(Icons.shopping_cart),
                          label: const Text(
                            'Add to Cart',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Buy Now Button
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PaymentPage.route(
                                orderId: 'ORD-001',
                                totalRate: widget.product.price,
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppPalette.firstColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
