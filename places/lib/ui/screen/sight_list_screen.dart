import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  var _appBarTextSimple = Padding(
    padding: EdgeInsets.only(left: 16, top: 64, right: 16),
    child: Text(
      "Список \nинтересных мест",
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.left,
      maxLines: 2,
      style: TextStyle(
        color: Color(0xff3B3E5B),
        fontFamily: "Roboto",
        fontStyle: FontStyle.normal,
        fontSize: 32,
      ),
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
    );
  }
}
