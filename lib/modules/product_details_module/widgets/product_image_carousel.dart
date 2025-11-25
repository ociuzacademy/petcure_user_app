// product_details_page.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide Image;

import 'package:petcure_user_app/core/constants/app_urls.dart';
import 'package:petcure_user_app/core/models/api_models/pet_product_model.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';
import 'package:petcure_user_app/modules/product_details_module/widgets/product_image_indicator.dart';

class ProductImageCarousel extends StatelessWidget {
  const ProductImageCarousel({
    super.key,
    required PageController pageController,
    required ValueNotifier<int> currentPage,
    required this.productId,
    required this.images,
  }) : _pageController = pageController,
       _currentPage = currentPage;
  final int productId;
  final PageController _pageController;
  final ValueNotifier<int> _currentPage;
  final List<Image> images;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Container(
        height: 300,
        width: double.infinity,
        color: Colors.grey[200],
        child: const Icon(
          Icons.image_not_supported,
          size: 60,
          color: Colors.grey,
        ),
      );
    }

    return Column(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(color: Colors.grey[200]),
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (int page) {
              _currentPage.value = page;
            },
            itemBuilder: (context, index) {
              final image = images[index];
              return Hero(
                tag: 'product-$productId',
                child: CachedNetworkImage(
                  imageUrl: '${AppUrls.baseUrl}${image.image}',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppPalette.firstColor,
                        ),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey[200],
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 60, color: Colors.grey),
                        SizedBox(height: 8),
                        Text(
                          'Failed to load image',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (context, currentIndex, _) {
            return ProductImageIndicator(
              totalImages: images.length,
              currentIndex: currentIndex,
            );
          },
        ),
      ],
    );
  }
}
