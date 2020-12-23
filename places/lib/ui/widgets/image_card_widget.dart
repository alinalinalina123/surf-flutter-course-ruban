import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';

//Widget used to show image on details pages.
class ImageCardWidget extends StatelessWidget {
  final String url;

  const ImageCardWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: standardWidgetTopCircleBorder,
      child: Image.network(
        url,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
