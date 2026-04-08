import 'package:flutter/material.dart';
import 'package:nexcart/core/ui/atoms/nex_shimmer.dart';

class HomeScreenCategoryShimmer extends StatelessWidget {
  const HomeScreenCategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    const widths = [92.0, 128.0, 84.0, 110.0, 140.0, 96.0];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: widths.map(
          (width) => NexShimmer(
            height: 36,
            width: width,
            borderRadius: 999,
          ),
        ).toList(),
      ),
    );
  }
}