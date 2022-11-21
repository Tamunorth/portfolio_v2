import 'dart:io';

import 'package:flutter/material.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class ImageWidget extends StatefulWidget {
  final double height;
  final double width;
  final BoxFit? fit;
  final BoxShape? shape;
  String imageUrl;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final double? size;
  final ImageWidgetType imageType;

  ImageWidget({
    Key? key,
    this.width = 24,
    this.height = 24,
    this.fit,
    this.shape,
    this.size,
    this.border,
    this.borderRadius,
    required this.imageUrl,
    this.imageType = ImageWidgetType.asset,
  }) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    // if (widget.imageType == ImageWidgetType.network) {
    //   logger.i(widget.imageUrl);
    // }
    return Container(
      key: widget.key,
      height: widget.size ?? 50,
      width: widget.size ?? 50,
      decoration: BoxDecoration(
        borderRadius: widget.borderRadius,
        shape: widget.shape ?? BoxShape.rectangle,
        border: widget.border,
        image: widget.imageType == ImageWidgetType.asset
            ? DecorationImage(
                image: AssetImage(widget.imageUrl),
                fit: widget.fit,
              )
            : widget.imageType == ImageWidgetType.file
                ? DecorationImage(
                    image: FileImage(
                      File(widget.imageUrl),
                    ),
                    fit: widget.fit,
                  )
                : null,
      ),
      child: widget.imageType == ImageWidgetType.network
          ? OptimizedCacheImage(
              memCacheWidth: 100,
              memCacheHeight: 100,
              maxHeightDiskCache: 1000,
              maxWidthDiskCache: 1000,
              imageUrl: widget.imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: widget.borderRadius,
                  shape: widget.shape ?? BoxShape.rectangle,
                  border: widget.border,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => const SizedBox(),
              errorWidget: (context, url, error) {
                return const Icon(
                  Icons.downloading,
                  size: 40,
                );
              },
            )
          : null,
    );
  }
}

enum ImageWidgetType { asset, network, file }
