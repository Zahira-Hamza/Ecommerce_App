import 'package:flutter/material.dart';

import '../../core/utils/app_styles.dart';

class MainErrorWidget extends StatelessWidget {
  const MainErrorWidget({super.key, required this.errorMessage, this.onRetry});
  final String errorMessage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(errorMessage, style: AppStyles.regular14darkBlue),
        ElevatedButton(
            onPressed: onRetry,
            child: Text(
              "Try Again",
              style: AppStyles.regular14darkBlue,
            ))
      ],
    );
  }
}
