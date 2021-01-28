import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/cards/category_card.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/utils/geolocator.dart';

/// Widget to show filters for list of sights
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues values;
  List<Category> categorySelected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: buildToolBar(),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                height: 24.0,
              ),
              Text(
                categoriesTitle,
                style: greySimpleTitle,
              ),
              buildCategories(),
              buildSlider(),
              buildSubmitButton(),
            ],
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }

  Widget buildToolBar() {
    return Row(
      children: [
        IconButton(
          icon: SvgPicture.asset(
            arrowIcon,
          ),
          onPressed: () {},
        ),
        FlatButton(
          child: Text(clearButtonTitle),
          textColor: colorGreen,
          onPressed: () {
            setState(() {
              values = null;
              categorySelected = [];
              categories.forEach((category) {
                category.isSelected = false;
              });
            });
          },
        ),
      ],
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  void refreshCategories(Category selectedCategory) {
    setState(() {
      if (selectedCategory.isSelected) {
        categorySelected.add(selectedCategory);
      } else {
        categorySelected.remove(selectedCategory);
      }
    });
  }

  Widget buildCategories() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 250.0,
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(categories.length, (index) {
            return CategoryCard(
              category: categories[index],
              notifyParent: refreshCategories,
            );
          }),
        ),
      ),
    );
  }

  Widget buildSubmitButton() {
    return FutureBuilder<List<Sight>>(
        future: distanceBetweenUserAndSight(mocks, values),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButtonWidget(
                title: _buttonTitle(snapshot.data),
                onPressed: () {},
              ),
            );
          }
          return CustomButtonWidget(
            title: _buttonTitle(mocks),
            onPressed: () {},
          );
        });
  }

  String _buttonTitle(List<Sight> sightsFilteredByDistance) {
    var categoriesToApply =
        categorySelected.isEmpty ? categories : categorySelected;
    var sightsFiltered = sightsFilteredByDistance.where((sightByDistance) =>
        categoriesToApply
            .where((category) => sightByDistance.type == category.type)
            .length >
        0);
    return "$showButtonTitle (${sightsFiltered.length})";
  }

  Widget buildSlider() {
    return Column(
      children: [
        Row(
          children: [
            Text(
              distanceTitle,
              style: blackSimpleTitle,
            ),
            Text(
              rangeTitle
                  .replaceAll(
                      "{0}", ((values?.start ?? 1) / 1000).toStringAsFixed(1))
                  .replaceAll("{1}",
                      ((values?.end ?? 10000) / 1000).toStringAsFixed(1)),
              style: greySimpleTitle,
            )
          ],
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        RangeSlider(
            min: 0,
            max: 10000,
            values: values ?? RangeValues(1, 10000),
            onChanged: (valuesSelected) {
              setState(() {
                values = valuesSelected;
              });
            })
      ],
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
