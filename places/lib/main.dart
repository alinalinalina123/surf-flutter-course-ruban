import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyFirstStatefulWidget(),
    );
  }
}

class MyFirstStatlessWidget extends StatelessWidget {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    print("Счетчик для stateless - $_count"); // always shows 1, since widget re-builds
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }
}

class MyFirstStatefulWidget extends StatefulWidget {
  @override
  _MyFirstStatefulWidgetState createState() => _MyFirstStatefulWidgetState();
}

class _MyFirstStatefulWidgetState extends State<MyFirstStatefulWidget> {
  var _count = 0;

  @override
  Widget build(BuildContext context) {
    _count++;
    print("Счетчик для stateless - $_count"); //shows incremented values (each time +1, like 1,2,3 and so on), since widget is redrawn
    return Container(
      child: Center(
        child: Text("Hello"),
      ),
    );
  }
}




