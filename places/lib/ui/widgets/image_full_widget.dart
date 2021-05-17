import 'package:flutter/material.dart';
import 'package:places/ui/widgets/custom_page_view_indicator.dart';
import 'package:places/utils/loader.dart';

//Widget used to show image on details pages.
class ImageFullWidget extends StatelessWidget {
  final List<String> urls;
  final _controller = PageController();

  ImageFullWidget({Key? key, required this.urls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: double.infinity,
          child: PageView.builder(
            itemCount: urls.length,
            controller: _controller,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image.network(
                  urls[index],
                  fit: BoxFit.fill,
                  loadingBuilder: buildImageLoadingIndicator,
                ),
              );
            },
          ),
        ),
        Positioned(
          right: 16.0,
          top: 36.0,
          width: 32.0,
          height: 32.0,
          child: RawMaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            elevation: 2.0,
            fillColor: Colors.white,
            child: Icon(
              Icons.close,
            ),
            shape: CircleBorder(),
          ),
        ),
        if (urls.length > 1)
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              width: double.infinity,
              child: CustomPageViewIndicator(
                controller: _controller,
                itemCount: urls.length,
              ),
            ),
          ),
      ],
    );
  }
}
