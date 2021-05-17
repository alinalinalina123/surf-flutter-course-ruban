import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/widgets/image_card_widget.dart';
import 'package:places/ui/widgets/positioned_icon_button_widget.dart';
import 'package:places/ui/widgets/sub_title_widget.dart';

/// Widget for card view of sight

class SightCard extends StatefulWidget {
  late final Sight sight;
  late final int index;
  late final SightStateType type;
  late final VoidCallback stateUpdated;
  late final VoidCallback orderChanged;

  SightCard({
    Key? key,
    required Sight sight,
    required int index,
    SightStateType? type,
    VoidCallback? stateUpdated,
    VoidCallback? orderChanged,
  }) : super(key: key) {
    this.sight = sight;
    this.index = index;
    this.type = type ?? SightStateType.initial;
    this.stateUpdated = stateUpdated ?? (){};
    this.orderChanged = orderChanged ?? (){};
  }

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
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
        child: card,
      ),
    );

    var target = DragTarget<Sight>(
      onWillAccept: (sight) {
        if(sight == null) return false;
        switch (widget.type) {
          case SightStateType.initial:
            return false;
          case SightStateType.want_to_visit:
            return listWantToVisit.indexOf(sight) != widget.index;
          case SightStateType.visited:
            return listVisited.indexOf(sight) != widget.index;
        }
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
      builder: (BuildContext context, List<Sight?> candidateData,
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
      default:
        return target;
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
            color: Theme.of(context).cardColor,
            borderRadius: standardWidgetCircleBorder,
          ),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: standardWidgetCircleBorder,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) {
                    return SightDetailsBottomSheet(
                      sightId: widget.sight.id,
                    );
                  });
            },
            child: widget.type != SightStateType.initial
                ? Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      _deleteFromList();
                    },
                    background: _buildCardDeleteContainer(),
                    child: content,
                  )
                : content,
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
              Text(
                deleteTitle,
                textAlign: TextAlign.right,
                style: whiteTitleStyle,
              ),
              Icon(
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
        ImageCardWidget(url: widget.sight.urls.first),
        SubTitleWidget(
          name: widget.sight.type.name,
          style: whiteTitleStyle,
          padding: standardWidgetPadding,
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
            _deleteFromList();
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
              if (widget.type == SightStateType.want_to_visit) {
                _openDateTimeSlection();
              }
            },
          )
      ]),
    );
  }

  Future<DateTime?> _openDateTimeSlection() async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2025),
        locale: const Locale(russianLanguageCode, russianCountryCode),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: colorGreen,
                onPrimary: Theme.of(context).accentColor,
                surface: Theme.of(context).primaryColor,
                onSurface: Theme.of(context).accentColor,
              ),
              dialogBackgroundColor: Theme.of(context).primaryColor,
            ),
            child: child ?? Container(),
          );
        });
  }

  void _deleteFromList() {
    switch (widget.type) {
      case SightStateType.initial:
        mocks.forEach(
          (sightFromData) => {
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
          (sightFromData) => {
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
          padding: topWidgetPadding,
        ),
        if (widget.type == SightStateType.visited)
          SubTitleWidget(
            name: widget.sight.stateDescription,
            style: greenSubTitleStyle,
            padding: bottomWidgetPadding,
          ),
        if (widget.type == SightStateType.want_to_visit)
          SubTitleWidget(
            name: widget.sight.stateDescription,
            style: greySubTitleLightStyle,
            padding: bottomWidgetPadding,
          ),
        SubTitleWidget(
          name: widget.sight.details,
          style: greySubTitleLightStyle,
          padding: bottomWidgetPadding,
        )
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }
}
