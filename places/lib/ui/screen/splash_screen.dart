import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/ui/res/assets_name.dart';
import 'package:places/ui/screen/on_boarding_screen.dart';


//Entry widget of application
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future _isInitialized = Future.delayed(Duration(seconds: 3));

  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  Future _navigateToNext() async {
    return await _isInitialized.then(
      (value) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return OnBoardingScreen();
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [Colors.green, Colors.yellow]),
        ),
        child: Center(
          child: SvgPicture.asset(
            logo_places,
            height: 160,
            width: 160,
          ),
        ),
      ),
    );
  }
}
