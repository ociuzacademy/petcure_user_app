import 'package:flutter/material.dart';

import 'package:petcure_user_app/core/theme/app_palette.dart';

class OverlayLoader {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, {String? message}) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (_) => Stack(
        children: [
          // Semi-transparent dark background
          ModalBarrier(
            color: AppPalette.blackColor.withValues(alpha: 0.5),
            dismissible: false,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppPalette.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: AppPalette.firstColor),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Flexible(
                      child: Text(
                        message,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: AppPalette.blackColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  static void updateMessage(String message) {
    if (_overlayEntry == null) return;
    _overlayEntry?.markNeedsBuild();
  }
}
