import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.width = double.infinity,
    this.height = 62,
    required this.title,
    required this.onPressed,
    required this.isLoading,
  });

  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 62,
      decoration: BoxDecoration(
        color: context.colors.primaryAction,
        borderRadius: BorderRadius.circular(999),
      ),
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: context.colors.onPrimary,
                  strokeWidth: 2.5,
                ),
              )
            : Text(
                title,
                style: context.textStyle.buttonLabel.copyWith(
                  color: context.colors.onPrimary,
                ), // adjust based on your setup
              ),
      ),
    );
  }
}
