// product_details_page.dart
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';

class ProductImageIndicator extends StatelessWidget {
  const ProductImageIndicator({
    super.key,
    required this.totalImages,
    required this.currentIndex,
  });

  final int totalImages;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalImages, (index) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? AppPalette.firstColor
                : Colors.grey.withValues(alpha: 0.5),
          ),
        );
      }),
    );
  }
}
