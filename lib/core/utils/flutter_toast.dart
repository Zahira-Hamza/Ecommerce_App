import 'package:flutter/material.dart';

enum ToastType { success, error, warning, info }

enum ToastPosition { top, bottom, center }

class FlutterToast {
  static void show({
    required BuildContext context,
    required String message,
    ToastType type = ToastType.info,
    Duration duration = const Duration(seconds: 2),
    ToastPosition position = ToastPosition.bottom,
    bool showIcon = true,
    Color? backgroundColor,
    Color? textColor,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
  }) {
    // Get the overlay state immediately
    final overlayState = Overlay.of(context);
    if (overlayState == null) return;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: position == ToastPosition.top
            ? MediaQuery.of(context).padding.top + 50
            : position == ToastPosition.center
                ? MediaQuery.of(context).size.height / 2 - 30
                : null,
        bottom: position == ToastPosition.bottom
            ? MediaQuery.of(context).padding.bottom + 50
            : null,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: padding ??
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: backgroundColor ?? _getBackgroundColor(type),
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (showIcon) ...[
                  Icon(
                    _getIcon(type),
                    color: textColor ?? _getTextColor(type),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: textColor ?? _getTextColor(type),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // Insert overlay immediately
    overlayState.insert(overlayEntry);

    // Remove overlay after duration
    Future.delayed(duration, () {
      overlayEntry.remove();
    });
  }

  static IconData _getIcon(ToastType type) {
    switch (type) {
      case ToastType.success:
        return Icons.check_circle;
      case ToastType.error:
        return Icons.error;
      case ToastType.warning:
        return Icons.warning;
      case ToastType.info:
        return Icons.info;
    }
  }

  static Color _getBackgroundColor(ToastType type) {
    switch (type) {
      case ToastType.success:
        return const Color(0xFF4CAF50);
      case ToastType.error:
        return const Color(0xFFF44336);
      case ToastType.warning:
        return const Color(0xFFFF9800);
      case ToastType.info:
        return const Color(0xFF2196F3);
    }
  }

  static Color _getTextColor(ToastType type) {
    return Colors.white;
  }
}
