import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/domain/category.dart';
import 'package:places/domain/filter_screen_input.dart';
import 'package:places/domain/sight.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/res/colors.dart';
import 'package:places/ui/res/strings.dart';
import 'package:places/ui/screen/filters_screen.dart';

class CustomSearchBar extends StatefulWidget {
  late final VoidCallback onPressed;
  late final Function(String) onQueryChanged;
  late final Function(FilterScreenInput)  onFilterApplied;
  late final bool isForNavigation;

  CustomSearchBar({
    Key? key,
    required VoidCallback onPressed,
    Function(String)? onQueryChanged,
    Function(FilterScreenInput)? onFilterApplied,
    required bool isForNavigation,
  }) : super(key: key) {
    this.onPressed = onPressed;
    this.isForNavigation = isForNavigation;
    this.onQueryChanged = onQueryChanged ?? (String query) {};
    this.onFilterApplied = onFilterApplied ?? (FilterScreenInput input) {};
  }

  @override
  _CustomSearchBarState createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  TextEditingController _controller = TextEditingController();
  bool _showClearButton = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _showClearButton = _controller.text.length > 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onTap: () {
          if (widget.isForNavigation) {
            widget.onPressed();
          }
        },
        onChanged: (String query) {
          if (query.split(" ").length > 1 && query.characters.last == " ")
            widget.onQueryChanged(query);
        },
        onSubmitted: (String query) {
          widget.onQueryChanged(query);
        },
        autofocus: !widget.isForNavigation,
        readOnly: widget.isForNavigation,
        controller: _controller,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          fillColor: colorLightGrey,
          suffixIcon: _showClearButton
              ? IconButton(
                  icon: SvgPicture.asset(clearIcon),
                  onPressed: () {
                    widget.onQueryChanged("");
                    _controller.clear();
                  },
                )
              : InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      FiltersScreen.routeName,
                    ).then(
                      (input) => widget.onFilterApplied(input as FilterScreenInput),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SvgPicture.asset(
                      filterIcon,
                      color: colorGreen,
                    ),
                  ),
                ),
          hintText: searchHint,
          prefixIcon: Icon(
            Icons.search,
            color: colorGrey,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorLightGrey,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(24.0),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: colorLightGrey,
            ),
            borderRadius: const BorderRadius.all(
              const Radius.circular(24.0),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      TextField(
        decoration: InputDecoration(
          fillColor: colorGrey,
          suffixIcon: SvgPicture.asset(
            filterIcon,
            color: colorGreen,
          ),
          hintText: searchHint,
          prefixIcon: Icon(
            Icons.search,
            color: colorGrey,
          ),
          border: null,
        ),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column();
  }
}
