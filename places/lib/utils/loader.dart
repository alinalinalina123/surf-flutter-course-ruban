import 'package:flutter/material.dart';

Widget buildImageLoadingIndicator(BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) return child;
  return Center(
    child: CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
          (loadingProgress.expectedTotalBytes ?? 1)
          : null,
    ),
  );
}

