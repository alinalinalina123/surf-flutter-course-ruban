import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings/strings.dart';

class SightDetails extends StatefulWidget {
  final Sight sight;

  SightDetails({this.sight}) : super();

  @override
  _SightDetailsState createState() => _SightDetailsState();
}

class _SightDetailsState extends State<SightDetails> {
  @override
  Widget build(BuildContext context) {
    var imageWidget = Stack(
      children: [
        Container(
          height: 360,
          child: Image.network(
            widget.sight.url,
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

    var titleWidget = Padding(
      padding: titleWidgetPadding,
      child: Text(
        widget.sight.name,
        style: greyTitleBigStyle,
      ),
    );

    var typeWidget = Padding(
      padding: leftWidgetPadding,
      child: Text(
        widget.sight.type.name,
        style: greySubTitleBoldStyle,
      ),
    );

    var scheduleTimeWidget = Padding(
      padding: leftWidgetPadding,
      child: Text(
        "закрыто до 09:00",
        style: greySubTitleLightStyle,
      ),
    );

    var descriptionWidget = Padding(
      padding: titleWidgetPadding,
      child: Text(
        widget.sight.details,
        style: greySubTitleStyle,
      ),
    );

    var destinationButton = Padding(
      padding: titleWidgetPadding,
      child: Container(
        color: Colors.green,
        height: 48,
      ),
    );

    var separator = Padding(
      padding: titleWidgetPadding,
      child: Divider(
        color: Colors.grey,
      ),
    );

    var scheduleWidget = Padding(
      padding: smallPadding,
      child: Row(
        children: [
          Icon(Icons.calendar_today),
          Text(scheduleButtonTitle)
        ],
      ),
    );

    var favouriteWidget = Padding(
      padding: smallPadding,
      child: Row(
        children: [
          Icon(Icons.favorite_border),
          Text(favouriteButtonTitle)
        ],
      ),
    );

    return Container(
      child: Column(
        children: [
          imageWidget,
          titleWidget,
          Row(
            children: [
              typeWidget,
              scheduleTimeWidget,
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          descriptionWidget,
          destinationButton,
          separator,
          Row(
            children: [
              scheduleWidget,
              favouriteWidget,
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
