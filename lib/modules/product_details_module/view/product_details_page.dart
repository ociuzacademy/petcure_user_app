// product_details_page.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/exports/bloc_exports.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/payment_module/view/payment_page.dart';
import 'package:petcure_user_app/modules/product_details_module/utils/product_details_helper.dart';
import 'package:petcure_user_app/widgets/app_widget_export.dart';
import 'package:petcure_user_app/widgets/loaders/custom_loading_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productId;
  const ProductDetailsPage({super.key, required this.productId});

  static route({required int productId}) => MaterialPageRoute(
    builder: (context) => ProductDetailsPage(productId: productId),
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
      context: context,
      addedToCart: _addedToCart,
      productId: widget.productId,
    );

    _productDetailsHelper.productDetailsInit();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        backgroundColor: AppPalette.firstColor,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<ProductOrderBloc, ProductOrderState>(
        listener: (context, state) {
          switch (state) {
            case ProductOrderLoading(:final message):
              OverlayLoader.show(context, message: message);
              break;
            case ProductOrderError(:final errorMessage):
              OverlayLoader.hide();
              CustomSnackBar.showError(context, message: errorMessage);
              break;
            case ProductAddToCart(:final addToCartResponse):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(
                context,
                message: addToCartResponse.message,
              );
              break;
            case BuyProductNow(:final buyNowResponse):
              OverlayLoader.hide();
              CustomSnackBar.showSuccess(
                context,
                message: buyNowResponse.message,
              );
              Navigator.pushReplacement(
                context,
                PaymentPage.route(
                  orderId: buyNowResponse.orderId,
                  totalRate: buyNowResponse.amountToPay,
                ),
              );
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            switch (state) {
              case ProductDetailsInitial _:
              case ProductDetailsLoading _:
                return const CustomLoadingWidget.centered(
                  message: 'Loading product details...',
                );
              case ProductDetailsError(:final errorMessage):
                return SafeArea(
                  child: Expanded(
                    child: Center(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Error loading product details: $errorMessage',
                                style: const TextStyle(color: Colors.red),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  _productDetailsHelper.productDetailsInit();
                                },
                                child: const Text('Retry'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              case ProductDetailsSuccess(:final product):
                return SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Product Image
                        Container(
                          height: screenSize.height * 0.35,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.grey[200]),
                          child: Image.network(
                            product.images.isNotEmpty
                                ? '${AppUrls.baseUrl}${product.images[0].image}'
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
                                product.name,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Price
                              Text(
                                '\u{20B9}${product.price}',
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
                                      '(in 5 days)',
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
                                      product.productcategoryName,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    backgroundColor: Colors.green[50],
                                  ),
                                  Chip(
                                    label: Text(
                                      product.petcategoryName,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    backgroundColor: Colors.orange[50],
                                  ),
                                  Chip(
                                    label: Text(
                                      product.petsubcategoryName,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    backgroundColor: Colors.blue[50],
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
                                      '• This item will be delivered within  5 days\n'
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                product.description,
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
            }
          },
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
            child: Row(
              children: [
                // First button - changes based on cart state
                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: addedToCart
                        ? _productDetailsHelper.navigateToCart
                        : _productDetailsHelper.addToCart,
                    // Alternative styling for the Go To Cart button
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppPalette.firstColor,
                      side: const BorderSide(color: AppPalette.firstColor),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    icon: Icon(
                      addedToCart
                          ? Icons.shopping_cart_checkout
                          : Icons.shopping_cart,
                    ),
                    label: Text(
                      addedToCart ? 'Go To Cart' : 'Add to Cart',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),

                // Buy Now Button (always visible)
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: _productDetailsHelper.buyNow,
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
