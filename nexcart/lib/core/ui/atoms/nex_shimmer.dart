import 'package:flutter/material.dart';
import 'package:nexcart/core/extensions/context_extension.dart';
import 'package:shimmer/shimmer.dart';

class NexShimmer extends StatelessWidget {
  const NexShimmer({
    super.key,
    required this.height,
    this.width = double.infinity,
    this.borderRadius = 16,
  });

  final double height;
  final double width;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: context.colors.shimmerBase,
      highlightColor: context.colors.shimmerHighlight,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
