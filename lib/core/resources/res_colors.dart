import 'package:flutter/material.dart';

class ResColors {
  const ResColors._privateConstructor();

  static const ResColors _instance = ResColors._privateConstructor();

  factory ResColors() {
    return _instance;
  }

  Color get textColor => Colors.black.withOpacity(0.5);
}
