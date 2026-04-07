import 'package:flutter/material.dart';

class NexImage extends StatelessWidget {
  const NexImage({
    super.key,
    required this.imagePath,
    required this.isLoading,
    required this.width,
    required this.height,
  });

  final String imagePath;
  final bool isLoading;

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: isLoading
          ? const CircularProgressIndicator() //Replace with shimmer
          : Image.network(imagePath, fit: BoxFit.cover),
    );
  }
}
