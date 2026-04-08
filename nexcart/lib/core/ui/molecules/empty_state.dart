import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: context.colors.primaryAction,
          ),
          Text(
            message,
            style: context.textStyle.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
