import 'package:flutter/material.dart';
import 'package:places/domain/sight_type.dart';

//Data class for category
class Category {
  late SightType type;
  late String name;
  late bool isSelected;
  late String iconName;

  Category(
     SightType type,
     bool isSelected,
     String iconName,
  ) {
    this.type = type;
    this.name = type.name;
    this.isSelected = isSelected;
    this.iconName = iconName;
  }
}
