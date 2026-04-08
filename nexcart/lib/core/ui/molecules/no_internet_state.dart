import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:nexcart/core/ui/atoms/primary_button.dart';

class NoInternetState extends StatelessWidget {
  final VoidCallback? onRetry;

  const NoInternetState({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(Icons.wifi_off_outlined, size: 48, color: context.colors.error),
          Text("No internet connection", style: context.textStyle.bodyMedium),
          if (onRetry != null)
            PrimaryButton(
              title: 'Retry',
              onPressed: onRetry,
              isLoading: false,
            ),
        ],
      ),
    );
  }
}