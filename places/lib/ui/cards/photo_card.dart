import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/utils/loader.dart';

//Widget for card of photo
class PhotoCard extends StatelessWidget {
  final String source;
  final void Function() photoRemoved;
  final void Function() photoAdded;

  PhotoCard({
    Key key,
    @required this.source,
    @required this.photoRemoved,
    @required this.photoAdded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: smallWidgetPadding,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: standardWidgetCircleBorder,
        ),
        child: source == fakePhotoUrl
            ? _buildAddPhotoCard(context)
            : _buildPhotoCard(context),
      ),
    );
  }

  Widget _buildAddPhotoCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        photos.add("https://34travel.me/media/posts/5cc09d7c87bd6-mostar-og.jpg");
        photoAdded();
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: standardWidgetCircleBorder,
            border: Border.all(
              color: colorGreen,
            )),
        child: Icon(
          Icons.add,
          color: colorGreen,
        ),
      ),
    );
  }

  Widget _buildPhotoCard(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: standardWidgetCircleBorder,
        child: Stack(alignment: Alignment.topRight, children: [
          Image.network(
            source,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: buildImageLoadingIndicator,
          ),
          Padding(
            padding: smallWidgetPadding,
            child: GestureDetector(
              onTap: () {
                photoRemoved();
              },
              child: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
