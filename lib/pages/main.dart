import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Constants.primaryColor,
        focusColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}
