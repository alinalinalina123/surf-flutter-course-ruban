import 'package:flutter/material.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings/strings.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  var _appBarTextSimple = Padding(
    padding: appBarPadding,
    child: Text(
      appBarTitle,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      maxLines: 2,
      style: appBarStyle,
      ),
    );

  var _appBarTextRich = Padding(
    padding: appBarPadding,
    child: RichText(
      text: TextSpan(
          style: appBarStyle,
          children: [
            TextSpan(text: "С",  style: TextStyle(color: Colors.green)),
            TextSpan(text: "писок\n"),
            TextSpan(text: "и", style: TextStyle(color: Colors.yellow)),
            TextSpan(text: "нтересных мест"),
          ]),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 136,
          title: _appBarTextRich,
          backgroundColor: Colors.transparent,
          elevation: 0.0),
    );
  }
}
