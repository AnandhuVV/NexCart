import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/primary_button.dart';

class ErrorState extends StatelessWidget {
  final String message;
  final VoidCallback? onRetry;

  const ErrorState({super.key, required this.message, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(Icons.error_outline, size: 48, color: context.colors.error),
          Text(
            message,
            style: context.textStyle.bodyMedium.copyWith(color: context.colors.error),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null)
            PrimaryButton(
              width: 100,
              height: 40,
              title: 'Retry',
              onPressed: onRetry,
              isLoading: false,
            ),
        ],
      ),
    );
  }
}
