import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({
    super.key,
    required this.blur,
    required this.url,
    this.child,
  });
  final double blur;
  final String url;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        url.startsWith('http')
            ? CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
            : Image.asset(
                url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: Colors.black.withOpacity(0.3),
            child: ClipRect(
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
