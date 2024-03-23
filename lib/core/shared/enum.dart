import 'package:flutter/material.dart';

Color getColorByType(String type) {
  switch (type) {
    case "dart":
      return Colors.white;
    case "light":
      return Colors.black;
    default:
      return Colors.white;
  }
}
