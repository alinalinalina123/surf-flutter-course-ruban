import 'package:flutter/material.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screen/res/themes.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/ui/screen/tabs_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places app',
      home: SightDetails(sight: mocks.first,),
      theme: darkTheme,
    );
  }
}




