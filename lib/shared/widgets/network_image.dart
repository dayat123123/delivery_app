import 'package:delivery_app/shared/extensions/string_extensions.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? networkImgUrl;
  final String assetImgUrl;
  final BoxFit fit;
  final double width;
  final double height;
  const CustomNetworkImage(
      {super.key,
      this.networkImgUrl,
      this.assetImgUrl = FilePaths.foodjpg,
      this.fit = BoxFit.fill,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return (networkImgUrl ?? "").isValidImageUrl
        ? Image.network(networkImgUrl!,
            fit: fit,
            width: width,
            height: height,
            errorBuilder: (context, error, stackTrace) =>
                _assetImage(assetImgUrl, width, height, fit))
        : _assetImage(assetImgUrl, width, height, fit);
  }

  Image _assetImage(String url, double width, double height, BoxFit fit) {
    return Image.asset(url, height: height, width: width, fit: fit);
  }
}
