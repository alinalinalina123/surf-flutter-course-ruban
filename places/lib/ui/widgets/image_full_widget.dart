import 'package:flutter/material.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/widgets/positioned_icon_button_widget.dart';
import 'package:places/utils/loader.dart';

//Widget used to show image on details pages.
class ImageFullWidget extends StatelessWidget {
  final String url;

  const ImageFullWidget({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 360,
          child: Image.network(
            url,
            fit: BoxFit.cover,
            loadingBuilder: buildImageLoadingIndicator,
          ),
        ),
        PositionedIconButtonWidget(
          left: 16.0,
          top: 36.0,
          width: 32.0,
          height: 32.0,
          iconName: arrowIcon,
          onPressed: () {
            print("Button Pressed");
          },
        )
      ],
    );
  }
}
