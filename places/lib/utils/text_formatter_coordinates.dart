import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:places/domain/field_types/input_field_type.dart';

//Custom formatter, which apply format based on input field type
class TextFormatterForCoordinates extends TextInputFormatter {
  late final InputFieldType type;

  TextFormatterForCoordinates(
     InputFieldType type,
  ) {
    this.type = type;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    switch (type) {
      case InputFieldType.lat:
        var newDouble = double.tryParse(newValue.text);
        if((newDouble == null) || newDouble > -90.0 && newDouble < 90.0){
          return TextEditingValue(
            text: newValue.text,
            selection: TextSelection.collapsed(offset: newValue.selection.end),
          );
        } else {
          return TextEditingValue(
            text: oldValue.text,
            selection: TextSelection.collapsed(offset: oldValue.selection.end),
          );
        }

      case InputFieldType.lon:
        var newDouble = double.tryParse(newValue.text);
        if((newDouble == null) || newDouble > -180.0 && newDouble < 180.0){
          return TextEditingValue(
            text: newValue.text,
            selection: TextSelection.collapsed(offset: newValue.selection.end),
          );
        } else {
          return TextEditingValue(
            text: oldValue.text,
            selection: TextSelection.collapsed(offset: oldValue.selection.end),
          );
        }

      default:
        return TextEditingValue(
          text: newValue.toString(),
          selection: TextSelection.collapsed(offset: newValue.selection.end),
        );
    }
  }
}
