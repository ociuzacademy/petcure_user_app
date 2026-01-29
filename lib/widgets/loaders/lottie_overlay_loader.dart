import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:petcure_user_app/core/theme/app_palette.dart';

enum LottieLoaderState { loading, success, failure }

class LottieOverlayLoader {
  static OverlayEntry? _overlayEntry;
  static LottieLoaderState _currentState = LottieLoaderState.loading;
  static String? _currentMessage;
  static VoidCallback? _onDismiss;

  static void show(
    BuildContext context, {
    LottieLoaderState state = LottieLoaderState.loading,
    String? message,
    VoidCallback? onDismiss,
  }) {
    _currentState = state;
    _currentMessage = message;
    _onDismiss = onDismiss;

    if (_overlayEntry != null) {
      _overlayEntry!.markNeedsBuild();
      return;
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => _LottieLoaderWidget(
        state: _currentState,
        message: _currentMessage,
        onDismiss: () {
          hide();
          _onDismiss?.call();
        },
      ),
    );

    Overlay.of(context, rootOverlay: true).insert(_overlayEntry!);
  }

  static void update({
    required LottieLoaderState state,
    String? message,
    VoidCallback? onDismiss,
  }) {
    _currentState = state;
    if (message != null) _currentMessage = message;
    if (onDismiss != null) _onDismiss = onDismiss;
    _overlayEntry?.markNeedsBuild();
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _LottieLoaderWidget extends StatelessWidget {
  final LottieLoaderState state;
  final String? message;
  final VoidCallback onDismiss;

  const _LottieLoaderWidget({
    required this.state,
    this.message,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    String assetPath;
    switch (state) {
      case LottieLoaderState.loading:
        assetPath = 'assets/animations/coin.json';
        break;
      case LottieLoaderState.success:
        assetPath = 'assets/animations/Success.json';
        break;
      case LottieLoaderState.failure:
        assetPath = 'assets/animations/Failed.json';
        break;
    }

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          ModalBarrier(
            color: AppPalette.blackColor.withValues(alpha: 0.5),
            dismissible: false,
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 40),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppPalette.whiteColor,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    assetPath,
                    width: 150,
                    height: 150,
                    repeat: state == LottieLoaderState.loading,
                    animate: true,
                  ),
                  if (message != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      message!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppPalette.blackColor,
                      ),
                    ),
                  ],
                  if (state != LottieLoaderState.loading) ...[
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: onDismiss,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: state == LottieLoaderState.success
                              ? Colors.green
                              : Colors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          state == LottieLoaderState.success
                              ? 'Continue'
                              : 'Try Again',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
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
  }
}
