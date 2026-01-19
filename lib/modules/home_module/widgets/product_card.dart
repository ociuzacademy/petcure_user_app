import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/api_models/pet_product_model.dart'
    hide Image;
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/product_details_module/view/product_details_page.dart';

class ProductCard extends StatelessWidget {
  final PetProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushWithoutNavBar(
          context,
          ProductDetailsPage.route(productId: product.id),
        );
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product image
              Hero(
                tag: 'product-${product.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: (product.images.isNotEmpty)
                        ? '${AppUrls.baseUrl}${product.images[0].image}'
                        : 'https://via.placeholder.com/300',
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, progress) =>
                        CircularProgressIndicator(
                          value: progress.progress,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppPalette.firstColor,
                          ),
                        ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Product details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Constrained chip section with horizontal scrolling
                    SizedBox(
                      height: 32, // Fixed height for chips
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Chip(
                              label: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 100,
                                ),
                                child: Text(
                                  product.petcategoryName,
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              backgroundColor: Colors.green[50],
                            ),
                            const SizedBox(width: 4),
                            Chip(
                              label: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 100,
                                ),
                                child: Text(
                                  product.petsubcategoryName,
                                  style: const TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              backgroundColor: Colors.blue[50],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\u{20B9}${product.price}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
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
      ),
    );
  }
}
