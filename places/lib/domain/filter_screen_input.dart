
import 'package:flutter/material.dart';

import 'category.dart';

//Data class for filter screen
class FilterScreenInput {
  late int? radius;
  late List<Category>? categories;

  FilterScreenInput(
      int? radius,
      List<Category>? categories,
      ) {
    this.radius = radius;
    this.categories = categories;
  }
}
