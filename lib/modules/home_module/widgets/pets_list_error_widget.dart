import 'package:flutter/material.dart';
import 'package:petcure_user_app/widgets/custom_error_widget.dart';

class PetsListErrorWidget extends StatelessWidget {
  const PetsListErrorWidget({
    super.key,
    required this.onRetry,
    required this.errorMessage,
  });

  final VoidCallback onRetry;
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return CustomErrorWidget.sliver(
      onRetry: onRetry,
      errorMessage: errorMessage,
    );
  }
}
