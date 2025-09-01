import 'package:flutter/material.dart';
import 'package:fruit_appp/home.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => home()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Center(child: Image(image: AssetImage('assets/logo/Grabber.png'))));
  }
}
