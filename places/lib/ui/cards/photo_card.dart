import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/utils/loader.dart';

//Widget for card of photo
class PhotoCard extends StatelessWidget {
  final String source;
  final int index;
  final void Function() updatePhotos;

  PhotoCard({
    Key key,
    @required this.source,
    @required this.index,
    @required this.updatePhotos,
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
        _pickedImage(context);
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
    return Dismissible(
      key: Key(index.toString()),
      direction: DismissDirection.up,
      onDismissed: (direction) {
        photos.removeAt(index - 1);
        updatePhotos();
      },
      child: Container(
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
                  photos.removeAt(index - 1);
                  updatePhotos();
                },
                child: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void _pickedImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        double width = MediaQuery.of(context).size.width;
        double height = MediaQuery.of(context).size.height;
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          // title: Center(child: Text("Evaluation our APP")),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    FlatButton.icon(
                      label: Text(cameraButtonTitle),
                      icon: Icon(
                        Icons.camera_alt,
                        color: colorGrey,
                      ),
                      onPressed: () =>
                          Navigator.pop(context, cameraButtonTitle),
                    ),
                    Divider(),
                    FlatButton.icon(
                      label: Text(photoButtonTitle),
                      icon: Icon(
                        Icons.image_outlined,
                        color: colorGrey,
                      ),
                      onPressed: () =>
                          Navigator.pop(context, cameraButtonTitle),
                    ),
                    Divider(),
                    FlatButton.icon(
                      label: Text(fileButtonTitle),
                      icon: Icon(
                        Icons.insert_drive_file_outlined,
                        color: colorGrey,
                      ),
                      onPressed: () =>
                          Navigator.pop(context, cameraButtonTitle),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CustomButtonWidget(
                title: cancelButtonTitle,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
