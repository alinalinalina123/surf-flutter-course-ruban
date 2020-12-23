import 'package:flutter/material.dart';

//Widget used to show image on details pages.
class ImageFullWidget extends StatelessWidget {
  final String url;

  const ImageFullWidget({Key key, @required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 360,
          child: Image.network(
            url,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 36.0,
          left: 16.0,
          child: Container(height: 32, width: 32, color: Colors.white),
        )
      ],
    );
  }
}
