import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  var appBarText = Padding(padding: EdgeInsets.only(left: 16, top: 64, right: 16),
      child: Text(
          "Список \nинтересных мест",
          overflow: TextOverflow.ellipsis,
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150),
        child: AppBar(
            flexibleSpace: appBarText,
            backgroundColor: Colors.transparent,
            elevation: 0.0
        ),
      ),
    );
  }
}
