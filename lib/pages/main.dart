import 'package:amuzesh_system/core/constants.dart';
import 'package:amuzesh_system/pages/home/home_view.dart';
import 'package:flutter/material.dart';

import 'home/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Constants.primaryColor,
          focusColor: Colors.white,
          scaffoldBackgroundColor: Constants.backColor),
      home: const HomePage(),
    );
  }
}
