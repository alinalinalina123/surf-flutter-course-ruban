import 'package:flutter/material.dart';
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
      home: TabsScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        fontFamily: "Roboto",
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}




