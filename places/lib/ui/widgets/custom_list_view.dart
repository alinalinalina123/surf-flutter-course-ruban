import 'dart:io';

import 'package:flutter/material.dart';

//Widget of customized ListView for both platforms
class CustomListView extends StatelessWidget {
  final List<dynamic> list;
  final List<Widget> cards;
  final IndexedWidgetBuilder itemBuilder;
  final Axis axis;

  CustomListView({
    Key key,
    this.list = const [],
    this.cards = const [],
    this.itemBuilder,
    this.axis = Axis.vertical,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return itemBuilder != null
        ? ListView.builder(
            scrollDirection: this.axis,
            itemCount: list.length,
            itemBuilder: itemBuilder,
            physics: Platform.isAndroid
                ? ClampingScrollPhysics()
                : BouncingScrollPhysics(),
          )
        : ListView(
            children: cards,
            physics: Platform.isAndroid
                ? ClampingScrollPhysics()
                : BouncingScrollPhysics(),
          );
  }
}
