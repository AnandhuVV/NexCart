import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

class SeeAllButton extends StatelessWidget {
  const SeeAllButton({
    super.key,
    required this.onPressed,
    this.label = "See All",
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surfaceTint,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          decoration: BoxDecoration(
            color: context.colors.background,
            border: BoxBorder.all(
              color: context.colors.primaryAction,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: context.textStyle.bodyThin.copyWith(
              color: context.colors.primaryAction,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
