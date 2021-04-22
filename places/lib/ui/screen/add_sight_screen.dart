import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/field_types/app_bar_type.dart';
import 'package:places/domain/field_types/input_field_type.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_state_type.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/cards/photo_card.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/screen/category_selection_screen.dart';
import 'package:places/ui/widgets/custom_app_bar.dart';
import 'package:places/ui/widgets/custom_button_widget.dart';
import 'package:places/ui/widgets/custom_input_field.dart';

//Widget for screen for adding new sights
class AddSightScreen extends StatefulWidget {
  static const routeName = '/mainScreen/sightListScreen/addNewSightScreen';

  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  Category? _categorySelected;
  TextEditingController _controllerCategory = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerLatitude = TextEditingController();
  TextEditingController _controllerLongitude = TextEditingController();
  TextEditingController _controllerDescription = TextEditingController();

  FocusNode _focusNodeCategory = FocusNode();
  FocusNode _focusNodeName = FocusNode();
  FocusNode _focusNodeLatitude = FocusNode();
  FocusNode _focusNodeLongitude = FocusNode();
  FocusNode _focusNodeDescription = FocusNode();
  var photosOfSight = photos;

  final _nameKey = GlobalKey<FormState>();
  final _latKey = GlobalKey<FormState>();
  final _lonKey = GlobalKey<FormState>();
  final _descriptionKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: newPlaceTitle,
        type: AppBarType.simple,
        backButtonTitle: cancelButtonTitle,
      ),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            _buildPhotosField(),
            _buildTitle(categoryTitle),
            _buildCategoryField(),
            _buildTitle(nameTitle),
            _buildNameField(),
            Row(
              children: [
                _buildCoordinateField(
                  InputFieldType.lat,
                  _controllerLatitude,
                  _focusNodeLatitude,
                ),
                _buildCoordinateField(
                  InputFieldType.lon,
                  _controllerLongitude,
                  _focusNodeLongitude,
                )
              ],
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            _buildShowOnMapButton(),
            _buildTitle(descriptionTitle),
            _buildDescriptionField(),
            _buildCreateButton()
          ],
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }

  Widget _buildPhotosField() {
    var sightPhotos = List.from(photos);
    sightPhotos.insert(0, fakePhotoUrl);
    return Padding(
      padding: smallWidgetPadding,
      child: SizedBox(
        height: 96,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sightPhotos.length,
          physics: Platform.isAndroid
              ? ClampingScrollPhysics()
              : BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return PhotoCard(
              source: sightPhotos[index],
              index: index,
              updatePhotos: () {
                setState(() {});
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryField() {
    _controllerCategory.text = _categorySelected?.name ?? notSelectedTitle;
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextField(
        focusNode: _focusNodeCategory,
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.navigate_next),
        ),
        onTap: () {
          Navigator.pushNamed(
            context,
            CategorySelectionScreen.routeName,
            arguments: CategorySelectionScreenArguments(
              initialCategory: _categorySelected,
              notifyParent: (Category category) {
                setState(() {
                  _categorySelected = category;
                });
              },
            ),
          );
        },
        readOnly: true,
        controller: _controllerCategory,
      ),
    );
  }

  Widget _buildNameField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomInputField(
        formKey: _nameKey,
        controller: _controllerName,
        focusNode: _focusNodeName,
        type: InputFieldType.simple,
        onChanged: (String value) {},
      ),
    );
  }

  Widget _buildCoordinateField(InputFieldType type,
      TextEditingController controller, FocusNode focusNode) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.1,
      child: Column(
        children: [
          if (type == InputFieldType.lat) _buildTitle(latTitle),
          if (type == InputFieldType.lon) _buildTitle(lonTitle),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: CustomInputField(
              formKey: type == InputFieldType.lat ? _latKey : _lonKey,
              focusNode: focusNode,
              controller: controller,
              type: type,
              onChanged: (String value) {},
            ),
          ),
        ],
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Widget _buildShowOnMapButton() {
    return FlatButton(
      child: Text(showOnMapTitle),
      onPressed: () {},
    );
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0),
      child: Text(
        title,
        style: greySimpleTitle,
      ),
    );
  }

  Widget _buildDescriptionField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomInputField(
        formKey: _descriptionKey,
        hint: enterTextHint,
        type: InputFieldType.multiline,
        controller: _controllerDescription,
        focusNode: _focusNodeDescription,
        onChanged: (String value) {},
      ),
    );
  }

  Widget _buildCreateButton() {
    return CustomButtonWidget(
      title: createTitle,
      onPressed: () {
        if (_nameKey.currentState?.validate() == true &&
            _latKey.currentState?.validate() == true &&
            _lonKey.currentState?.validate() == true &&
            _descriptionKey.currentState?.validate() == true
        ) {
          var sight = Sight(
            id: mocks.length + 1,
            name: _controllerName.text,
            urls: [""],
            lat: double.tryParse(_controllerLatitude.text) ?? 0.0,
            lon: double.tryParse(_controllerLongitude.text) ?? 0.0,
            type: _categorySelected?.type ?? SightType.museum,
            state: SightStateType.initial,
            details: _controllerDescription.text,
          );
          mocks.add(sight);
          Navigator.pop(context);
        }
      },
    );
  }
}
