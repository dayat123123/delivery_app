import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app/shared/extensions/string_extensions.dart';
import 'package:delivery_app/shared/misc/file_paths.dart';
import 'package:delivery_app/shared/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? networkImgUrl;
  final String? fileImgURl;
  final String assetImgUrl;
  final BoxFit fit;
  final double width;
  final double height;
  final CustomNetworkImageShape shape;
  final double borderRadius;
  final double radius;
  final bool isshowProgressOnLoading;
  final CustomNetworkImageSource sourceImageFrom;

  const CustomNetworkImage(
      {super.key,
      this.networkImgUrl,
      this.assetImgUrl = FilePaths.foodjpg,
      this.fit = BoxFit.fill,
      this.width = double.infinity,
      this.height = double.infinity,
      this.shape = CustomNetworkImageShape.rounded,
      this.borderRadius = 0,
      this.radius = 40,
      this.isshowProgressOnLoading = true,
      this.sourceImageFrom = CustomNetworkImageSource.network,
      this.fileImgURl});

  @override
  Widget build(BuildContext context) {
    switch (shape) {
      case CustomNetworkImageShape.circle:
        return CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: radius,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(110), child: _image()));
      case CustomNetworkImageShape.rounded:
        return ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius), child: _image());
    }
  }

  Widget _assetImage() {
    return Image.asset(assetImgUrl, height: height, width: width, fit: fit);
  }

  Widget _image() {
    switch (sourceImageFrom) {
      case CustomNetworkImageSource.file:
        return (fileImgURl ?? "").isValidImageFile
            ? Image.file(File(fileImgURl!),
                errorBuilder: (context, error, stackTrace) => _assetImage(),
                fit: fit,
                height: height,
                width: width)
            : _assetImage();

      case CustomNetworkImageSource.network:
        return (networkImgUrl ?? "").isValidImageUrl
            ? CachedNetworkImage(
                imageUrl: networkImgUrl!,
                fit: fit,
                width: width,
                height: height,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return Center(
                      child: isshowProgressOnLoading
                          ? progressIndicatorWidget(
                              context: context,
                              value: downloadProgress.progress)
                          : Container());
                },
                errorWidget: (context, url, error) => _assetImage())
            : _assetImage();

      case CustomNetworkImageSource.asset:
        return _assetImage();
    }
  }
}

enum CustomNetworkImageShape { rounded, circle }

enum CustomNetworkImageSource { network, asset, file }
