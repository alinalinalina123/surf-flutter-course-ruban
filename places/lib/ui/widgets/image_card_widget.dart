import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/utils/loader.dart';

//Widget used to show image on details pages.
class ImageCardWidget extends StatelessWidget {
  final String url;
  final double? radius;

  const ImageCardWidget({Key? key, required this.url, this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius != null ? BorderRadius.circular(radius ?? 0) : standardWidgetTopCircleBorder,
      child: Image.network(
        url,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: buildImageLoadingIndicator,
      ),
    );
  }
}
