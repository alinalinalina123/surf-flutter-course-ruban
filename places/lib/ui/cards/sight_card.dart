import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/text_styles.dart';

class SightCard extends StatelessWidget {
  final Sight sight;

  SightCard({this.sight}) : super();

  @override
  Widget build(BuildContext context) {
    var cardImageWidget = Container(
      child: Stack(children: [
        ClipRRect(
          borderRadius: standardWidgetTopCircleBorder,
          child: Image.network(sight.url, fit: BoxFit.cover),
        ),
        Padding(
          padding: standardWidgetPadding,
          child: Text(
            sight.type.name,
            style: greyTitleBigStyle,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Padding(
            padding: standardWidgetPadding,
            child: Container(height: 20, width: 20, color: Colors.white),
          ),
        ),
      ]),
    );

    var cardDescriptionWidget = Container(
      child: Padding(
        padding: standardWidgetPadding,
        child: Column(
          children: [
            Text(
              sight.name,
              style: greyTitleStyle,
            ),
            Text(
              sight.details,
              style: greySubTitleLightStyle,
            )
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );

    return Padding(
      padding: standardWidgetPadding,
      child: Container(
        constraints: BoxConstraints(minHeight: 100),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: standardWidgetCircleBorder,
        ),
        child: Column(
          children: [cardImageWidget, cardDescriptionWidget],
        ),
      ),
    );
  }
}
