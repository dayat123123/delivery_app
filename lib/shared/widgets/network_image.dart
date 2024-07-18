import 'package:delivery_app/shared/extensions/string_extensions.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? networkImgUrl;
  final String assetImgUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final CustomNetworkImageShape shape;
  final double borderRadius;
  final double scale;
  const CustomNetworkImage(
      {super.key,
      this.networkImgUrl,
      this.assetImgUrl = FilePaths.foodjpg,
      this.fit = BoxFit.fill,
      this.width = double.infinity,
      this.height = double.infinity,
      this.shape = CustomNetworkImageShape.rounded,
      this.borderRadius = 0,
      this.scale = 0.75});

  @override
  Widget build(BuildContext context) {
    final imageWidget = (networkImgUrl ?? "").isValidImageUrl
        ? Image.network(networkImgUrl!,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) => _assetImage())
        : _assetImage();
    switch (shape) {
      case CustomNetworkImageShape.circle:
        return Transform.scale(
            scale: scale, child: ClipOval(child: imageWidget));
      case CustomNetworkImageShape.rounded:
        return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: imageWidget);
    }
  }

  Image _assetImage() {
    return Image.asset(assetImgUrl, height: height, width: width, fit: fit);
  }
}

enum CustomNetworkImageShape { rounded, circle }
