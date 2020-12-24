import 'package:flutter/material.dart';
import 'package:places/ui/screen/sight_details_screen.dart';
import 'package:places/mocks.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places app',
      home: Scaffold(body: SightDetails(sight: mocks[1], )),
    );
  }
}




