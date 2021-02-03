import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/category.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';

//Class that provide widget for categories filter view
class CategoryCard extends StatefulWidget {
  final Category category;
  final void Function(Category) notifyParent;

  CategoryCard({Key key, @required this.category, @required this.notifyParent})
      : super(key: key);

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            _buildCircleButton(),
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
    );
  }

  Widget _buildCircleButton() {
    return InkWell(
      splashColor: Colors.transparent,
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      onTap: () {
        setState(() {
          widget.category.isSelected = !widget.category.isSelected;
          widget.notifyParent(widget.category);
        });
      },
      child: CircleAvatar(
        radius: 32.0,
        backgroundColor: colorLightGreen,
        child: SvgPicture.asset(widget.category.iconName),
      ),
    );
  }
}
