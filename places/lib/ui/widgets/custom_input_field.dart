import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/field_types/input_field_type.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/utils/text_formatter_coordinates.dart';

//Widget for custom input field
class CustomInputField extends StatefulWidget {
  final String? hint;
  final void Function(String) onChanged;
  final TextEditingController controller;
  final FocusNode focusNode;
  final InputFieldType type;
  final GlobalKey formKey;

  CustomInputField({
    Key? key,
    required this.onChanged,
    this.hint,
    required this.controller,
    required this.focusNode,
    required this.formKey,
    required this.type,
  }) : super(key: key);

  @override
  _CustomInputFieldState createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _showClearButton =
            widget.controller.text.length > 0 && widget.focusNode.hasFocus;
      });
    });

    widget.focusNode.addListener(() {
      if (!widget.focusNode.hasFocus) {
        setState(() {
          _showClearButton = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: TextFormField(
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLines: widget.type == InputFieldType.multiline ? null : 1,
        cursorColor: colorGrey,
        textInputAction: widget.type == InputFieldType.multiline
            ? TextInputAction.done
            : TextInputAction.next,
        onEditingComplete: () => context.nextEditableTextFocus(),
        keyboardType: _inputForNumbers()
            ? TextInputType.numberWithOptions(decimal: true)
            : null,
        inputFormatters: _inputForNumbers()
            ? <TextInputFormatter>[
                TextFormatterForCoordinates(widget.type),
              ]
            : null,
        validator: (String? value) {
          return _validateInput(value ?? "");
        },
        decoration: InputDecoration(
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: SvgPicture.asset(clearIcon),
                  onPressed: () {
                    widget.controller.clear();
                  },
                )
              : null,
          hintText: widget.hint,
          hintStyle: greySubTitleLightStyle,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 1,
              color: colorGreen,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 1,
              color: colorGreen,
            ),
          ),
        ),
      ),
    );
  }

  String? _validateInput(String value) {
    if (widget.controller.text.length == 0) return inputEmptyErrorTitle;
    if ((widget.type == InputFieldType.lat ||
            widget.type == InputFieldType.lon) &&
        double.tryParse(value) == null) {
      return inputNotDoubleErrorTitle;
    }
    return null;
  }

  bool _inputForNumbers() {
    return widget.type == InputFieldType.lat ||
        widget.type == InputFieldType.lon;
  }

  @override
  void dispose() {
    widget.focusNode.dispose();
    widget.controller.dispose();
    super.dispose();
  }
}

extension Utility on BuildContext {
  void nextEditableTextFocus() {
    do {
      FocusScope.of(this).nextFocus();
    } while (FocusScope.of(this).focusedChild?.context?.widget is! EditableText);
  }
}
