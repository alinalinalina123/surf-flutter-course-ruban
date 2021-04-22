import 'package:flutter/cupertino.dart';
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
    Key? key,
    required this.source,
    required this.index,
    required this.updatePhotos,
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

  Widget _buildAlertSheetButton(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: colorGrey,
        ),
        Text(
          title,
          style: TextStyle(
            color: colorGrey,
          ),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  void _pickedImage(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: _buildAlertSheetButton(
              cameraButtonTitle,
              Icons.camera_alt,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: _buildAlertSheetButton(
              photoButtonTitle,
              Icons.image_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          CupertinoActionSheetAction(
            child: _buildAlertSheetButton(
              fileButtonTitle,
              Icons.insert_drive_file_outlined,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text(
            cancelButtonTitle,
            style: TextStyle(
              color: colorGreen,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
