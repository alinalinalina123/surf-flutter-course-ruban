import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/category.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';

//Class that provide widget for categories filter view
class CategoryCard extends StatefulWidget {
  final Category category;
  final Function(Category) notifyParent;

  CategoryCard({Key key, @required this.category, @required this.notifyParent}) : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          widget.category.isSelected = !widget.category.isSelected;
          widget.notifyParent(widget.category);
        });
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 32.0,
                backgroundColor: colorLightGreen,
                child: SvgPicture.asset(widget.category.iconName),
              ),
              if (widget.category.isSelected)
                CircleAvatar(
                  radius: 12.0,
                  backgroundColor: colorLightGreen,
                  child: SvgPicture.asset(ticIcon),
                ),
            ],
          ),
          Text(widget.category.name)
        ],
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
