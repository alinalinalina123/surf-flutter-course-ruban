import 'dart:io';
import 'package:flutter/material.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';

class CategorySelectionScreenArguments {
  final void Function(Category) notifyParent;
  final Category initialCategory;

  CategorySelectionScreenArguments({
    Key key,
    this.initialCategory,
    this.notifyParent,
  });
}

//Widget for screen for category selection
class CategorySelectionScreen extends StatefulWidget {
  static const routeName =
      '/mainScreen/sightListScreen/searchScreen/filtersScreen/categorySelectionScreen';

  CategorySelectionScreen({
    Key key,
  }) : super(key: key);

  @override
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  int selectedRadioTile;

  @override
  Widget build(BuildContext context) {
    final CategorySelectionScreenArguments input =
    ModalRoute.of(context).settings.arguments as CategorySelectionScreenArguments;
    return Scaffold(
      appBar: CustomAppBar(
        title: categoryPageTitle,
        type: AppBarType.simple,
        backButtonIcon: Icons.arrow_back_ios,
      ),
      body: ListView(
        children: createRadioListCategories(input),
        physics: Platform.isAndroid
            ? ClampingScrollPhysics()
            : BouncingScrollPhysics(),
      ),
    );
  }

  List<Widget> createRadioListCategories(CategorySelectionScreenArguments input) {
    List<Widget> widgets = [];
    for (Category category in categories) {
      widgets.add(_buildCategoryCell(category, input));
    }
    widgets.add(_buildCreateButton(input));
    return widgets;
  }

  Widget _buildCategoryCell(Category category, CategorySelectionScreenArguments input) {
    return ListTile(
      selected: category.type.index == selectedRadioTile ?? input.initialCategory?.type?.index,
      selectedTileColor: Colors.transparent,
      title: Text(
        category.name,
        style: greySimpleTitle,
      ),
      trailing: category.type.index == selectedRadioTile ?? input.initialCategory?.type?.index
          ? Icon(
              Icons.done,
              color: colorGreen,
            )
          : null,
      onTap: () {
        setState(() {
          selectedRadioTile = category.type.index;
        });
      },
    );
  }

  Widget _buildCreateButton(CategorySelectionScreenArguments input ) {
    return CustomButtonWidget(
      title: saveTitle,
      onPressed: () {
        input.notifyParent(
          categories.firstWhere(
              (category) => category.type.index == selectedRadioTile),
        );
        Navigator.pop(context);
      },
    );
  }
}
