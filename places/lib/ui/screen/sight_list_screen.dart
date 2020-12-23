import 'package:flutter/material.dart';
import 'package:places/ui/cards/sight_card.dart';
import 'package:places/ui/res/text_styles.dart';
import 'package:places/ui/res/strings/strings.dart';
import 'package:places/mocks.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 136,
          title: _appBarTextSimple,
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: ListView.builder(
        itemCount: mocks.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return SightCard(sight: mocks[index]);
        },
      ),
    );
  }
}
