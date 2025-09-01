import 'package:flutter/material.dart';
import 'package:fruit_appp/home.dart';

void main(List<String> args) {
  runApp(fruitApp());
}

class fruitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(debugShowCheckedModeBanner: false, home: home()));
  }
}
