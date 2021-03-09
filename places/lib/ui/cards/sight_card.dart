import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/widgets/image_card_widget.dart';
import 'package:places/ui/widgets/positioned_icon_button_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

// Widget for card view of sight

class SightCard extends StatefulWidget {
  final Sight sight;
  final int index;
  final SightStateType type;
  final VoidCallback stateUpdated;
  final VoidCallback orderChanged;

  SightCard({Key key,
    @required this.sight,
    @required this.index,
    this.stateUpdated,
    this.type = SightStateType.initial,
    this.orderChanged})
      : super(key: key);

  @override
  _SightCardState createState() => _SightCardState();
}

class _SightCardState extends State<SightCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Widget card = _buildCard(context);
    Draggable draggable = LongPressDraggable<Sight>(
      data: widget.sight,
      axis: Axis.vertical,
      maxSimultaneousDrags: 1,
      child: card,
      childWhenDragging: Container(),
      feedback: ConstrainedBox(
        constraints:
        BoxConstraints(maxWidth: MediaQuery
            .of(context)
            .size
            .width),
        child: card,
      ),
    );

    var target = DragTarget<Sight>(
      onWillAccept: (sight) {
        switch (widget.type) {
          case SightStateType.initial:
            return false;
            break;
          case SightStateType.want_to_visit:
            return listWantToVisit.indexOf(sight) != widget.index;
            break;
          case SightStateType.visited:
            return listVisited.indexOf(sight) != widget.index;
            break;
        }
        return false;
      },
      onAccept: (sight) {
        switch (widget.type) {
          case SightStateType.initial:
            break;
          case SightStateType.want_to_visit:
            int currentIndex = listWantToVisit.indexOf(sight);
            listWantToVisit.remove(sight);
            listWantToVisit.insert(
                currentIndex > widget.index ? widget.index : widget.index - 1,
                sight);
            widget.orderChanged();
            break;
          case SightStateType.visited:
            int currentIndex = listVisited.indexOf(sight);
            listVisited.remove(sight);
            listVisited.insert(
                currentIndex > widget.index ? widget.index : widget.index - 1,
                sight);
            widget.orderChanged();
            break;
        }
      },
      builder: (BuildContext context, List<Sight> candidateData,
          List<dynamic> rejectedData) {
        return Column(
          children: [
            candidateData.isEmpty ? draggable : card,
          ],
        );
      },
    );

    switch (widget.type) {
      case SightStateType.initial:
        return card;
        break;
      default:
        return target;
        break;
    }
  }

  Widget _buildCard(BuildContext context) {
    var content = Column(
      children: [
        _buildCardImage(),
        const SizedBox(height: 16),
        _buildCardDescription(),
      ],
    );

    return Padding(
      padding: standardWidgetPadding,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            color: Theme
                .of(context)
                .cardColor,
            borderRadius: standardWidgetCircleBorder,
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: standardWidgetCircleBorder,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SightDetails(
                    sight: widget.sight,
                  );
                }),
              );
            },
            child: widget.type != SightStateType.initial ? Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              onDismissed: (direction) {
                deleteFromList();
              },
              background: _buildCardDeleteContainer(),
              child: content,
            ) : content,
          ),
        ),
      ),
    );
  }

  Widget _buildCardDeleteContainer() {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: standardWidgetCircleBorder,
        ),
        child: Padding(
          padding: standardWidgetPadding,
          child: Row(
            children: [
              new Text(
                deleteTitle,
                textAlign: TextAlign.right,
                style: whiteTitleStyle,
              ),
              new Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ));
  }

  Widget _buildCardImage() {
    return SizedBox(
      width: double.infinity,
      height: 96,
      child: Stack(children: [
        ImageCardWidget(url: widget.sight.url),
        SubTitleWidget(
          name: widget.sight.type.name,
          style: whiteTitleStyle,
          paddings: standardWidgetPadding,
        ),
        PositionedIconButtonWidget(
          top: 16,
          right: 16,
          iconName: (widget.type == SightStateType.initial)
              ? widget.sight.state == SightStateType.want_to_visit
              ? heartIconDarkSelected
              : heartIconLightUnselected
              : closeIconLight,
          onPressed: () {
            deleteFromList();
          },
        ),
        if (widget.type != SightStateType.initial)
          PositionedIconButtonWidget(
            top: 16,
            right: 48,
            iconName: (widget.type == SightStateType.want_to_visit)
                ? calendarIconLight
                : shareIconLight,
            onPressed: () {
              print("Button clicked");
            },
          )
      ]),
    );
  }

  void deleteFromList() {
    switch (widget.type) {
      case SightStateType.initial:
        mocks.forEach(
              (sightFromData) =>
          {
            if (sightFromData == widget.sight)
              {
                widget.sight.state =
                widget.sight.state == SightStateType.want_to_visit
                    ? SightStateType.initial
                    : SightStateType.want_to_visit
              }
          },
        );
        break;
      default:
        mocks.forEach(
              (sightFromData) =>
          {
            if (sightFromData == widget.sight)
              {widget.sight.state = SightStateType.initial}
          },
        );
        break;
    }
    widget.stateUpdated();
  }

  Widget _buildCardDescription() {
    return Column(
      children: [
        SubTitleWidget(
          name: widget.sight.name,
          paddings: topWidgetPadding,
        ),
        if (widget.type == SightStateType.visited)
          SubTitleWidget(
            name: widget.sight.stateDescription,
            style: greenSubTitleStyle,
            paddings: bottomWidgetPadding,
          ),
        if (widget.type == SightStateType.want_to_visit)
          SubTitleWidget(
            name: widget.sight.stateDescription,
            style: greySubTitleLightStyle,
            paddings: bottomWidgetPadding,
          ),
        SubTitleWidget(
          name: widget.sight.details,
          style: greySubTitleLightStyle,
          paddings: bottomWidgetPadding,
        )
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
