import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(999),
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        height: 36,
        decoration: BoxDecoration(
          color: isSelected
              ? context.colors.primaryAction.withAlpha(60)
              : context.colors.surfaceTint,
          border: Border.all(
            color: isSelected
                ? context.colors.primaryAction
                : context.colors.onSurface.withAlpha(60),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: context.textStyle.bodyNormal.copyWith(
            fontSize: 16,
            color: isSelected
                ? context.colors.textPrimary
                : context.colors.textSecondary,
          ),
        ),
      ),
    );
  }
}
