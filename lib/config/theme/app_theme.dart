import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
  Colors.yellow,
  Colors.cyan,
  Colors.lime,
];
class AppTheme {
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
    }): assert(selectedColor >= 0 && selectedColor < colorList.length , 'Selectedc color must be between 0 and ${colorList.length - 1}');

  ThemeData getTheme() {
    return ThemeData(
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
      useMaterial3: true,
    );}



  }
