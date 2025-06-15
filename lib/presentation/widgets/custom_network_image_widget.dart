import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String fallbackImageUrl;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.fallbackImageUrl = 'https://i.pinimg.com/736x/cb/07/2c/cb072c8e068a31a9d7e4fd72437b1a2a.jpg', //dummy image
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return Image.network(
        fallbackImageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    }

    return Image.network(
      imageUrl!,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          fallbackImageUrl,
          height: height,
          width: width,
          fit: fit,
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return SizedBox(
          height: height,
          width: width,
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
