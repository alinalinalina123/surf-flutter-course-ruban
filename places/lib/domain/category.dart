import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';

//Data class for category
class Category {
  SightType type;
  String name;
  bool isSelected;
  String iconName;

  Category({
    @required SightType type,
    @required bool isSelected,
    @required String iconName,
  }) {
    this.type = type;
    this.name = type.name;
    this.isSelected = isSelected;
    this.iconName = iconName;
  }
}
