import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/filter_screen_input.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/cards/category_card.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

/// Widget to show filters for list of sights
class FiltersScreen extends StatefulWidget {
  static const routeName =
      '/mainScreen/sightListScreen/searchScreen/filtersScreen';

  FiltersScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues? values;
  List<Category> categorySelected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
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
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  categoriesTitle,
                  style: greySimpleTitle,
                ),
                buildCategories(),
                buildSlider(),
                buildSubmitButton(),
              ],
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
      ),
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
    var isSmallSizedPlatform = MediaQuery.of(context).size.height < 600;
    var cards = List.generate(
      categories.length,
      (index) {
        return CategoryCard(
          category: categories[index],
          notifyParent: refreshCategories,
        );
      },
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isSmallSizedPlatform
          ? SizedBox(
              height: 70.0,
              child: ListView(
                children: cards,
                scrollDirection: Axis.horizontal,
              ),
            )
          : SizedBox(
              height: 250.0,
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: cards,
              ),
            ),
    );
  }

  Widget buildSubmitButton() {
    return FutureBuilder<List<Sight>>(
        future: context.read<PlaceInteractor>().getPlacesFiltered(values, categorySelected),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButtonWidget(
                title: _buttonTitle(snapshot.data),
                onPressed: () {
                  var input = FilterScreenInput(values?.end.toInt(), categorySelected);
                  Navigator.of(context).pop(input);
                },
              ),
            );
          }
          return CustomButtonWidget(
            title: _buttonTitle(List.empty()),
            onPressed: () {
              Navigator.of(context).pop(List.empty());
            },
          );
        });
  }

  String _buttonTitle(List<Sight>? sightsFilteredByDistance) {
    var categoriesToApply =
        categorySelected.isEmpty ? categories : categorySelected;
    var sightsFiltered = sightsFilteredByDistance?.where((sightByDistance) =>
        categoriesToApply
            .where((category) => sightByDistance.type == category.type)
            .length >
        0);
    return "$showButtonTitle (${sightsFiltered?.length ?? 0})";
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
