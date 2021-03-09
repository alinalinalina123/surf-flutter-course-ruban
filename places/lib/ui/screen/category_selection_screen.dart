import 'package:flutter/material.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/ui/widgets/custom_list_view.dart';

//Widget for screen for category selection
class CategorySelectionScreen extends StatefulWidget {
  final void Function(Category) notifyParent;
  final Category initialCategory;

  CategorySelectionScreen({
    Key key,
    @required this.initialCategory,
    @required this.notifyParent,
  }) : super(key: key);

  @override
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    selectedRadioTile = widget.initialCategory?.type?.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: categoryPageTitle,
        type: AppBarType.simple,
        backButtonIcon: Icons.arrow_back_ios,
      ),
      body: CustomListView(
        cards: createRadioListCategories(),
      ),
    );
  }

  List<Widget> createRadioListCategories() {
    List<Widget> widgets = [];
    for (Category category in categories) {
      widgets.add(_buildCategoryCell(category));
    }
    widgets.add(_buildCreateButton());
    return widgets;
  }

  Widget _buildCategoryCell(Category category) {
    return ListTile(
      selected: category.type.index == selectedRadioTile,
      selectedTileColor: Colors.transparent,
      title: Text(
        category.name,
        style: greySimpleTitle,
      ),
      trailing: category.type.index == selectedRadioTile
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

  Widget _buildCreateButton() {
    return CustomButtonWidget(
      title: saveTitle,
      onPressed: () {
        widget.notifyParent(
          categories.firstWhere(
              (category) => category.type.index == selectedRadioTile),
        );
        Navigator.pop(context);
      },
    );
  }
}
