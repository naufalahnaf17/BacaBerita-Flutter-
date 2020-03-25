import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  void _splashScreen() async {
    Future.delayed(
        Duration(seconds: 3),(){
          Navigator.pushReplacementNamed(context, '/home');
     }
    );
  }

  @override
  void initState() {
    super.initState();
    _splashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Image.asset(
          'assets/splash.png',
          fit: BoxFit.fill,
        ),
    );
  }
}

