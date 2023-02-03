import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constants{

  static String  extraTermMsg = 'you cant add more than 10 term! finish your classes maximum at 10 term';
  static String  classLimitationMsg = 'please select at least 12 unit and lower than 20 unit';

  static SizedBox bigSizeBox = const SizedBox(height: 100);
  static SizedBox normalSizeBox = const SizedBox(height: 50);
  static SizedBox normalSizeBox2 = const SizedBox(height: 30);
  static SizedBox littleSizeBox = const SizedBox(height: 10);
  static SizedBox bigSizeBoxWidth = const SizedBox(width: 100);

  static Color textFieldColor = const Color.fromARGB(255, 213, 232, 255);
  static Color backColor = const Color.fromARGB(255, 215, 215, 215);

  static  MaterialColor primaryColor = MaterialColor(
    const Color.fromARGB(255, 28, 25, 98).value,
    <int, Color>{
      50: Colors.white.withOpacity(1),
      100: Colors.white.withOpacity(0.2),
      200: Colors.white.withOpacity(0.3),
      300: Colors.white.withOpacity(0.4),
      400: Colors.white.withOpacity(0.5),
      500: Colors.white.withOpacity(0.6),
      600: Colors.white.withOpacity(0.7),
      700: Colors.white.withOpacity(0.8),
      800: Colors.white.withOpacity(0.9),
      900: Colors.white.withOpacity(1),
    },
  );

}