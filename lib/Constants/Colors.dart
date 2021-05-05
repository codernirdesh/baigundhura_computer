import 'package:flutter/material.dart';

class CustomColors {
  MainColorType mainColors = MainColorType.fromMap(
    {
      'red': Color(0xFFCC0202),
      'black': Color(0xFF000000),
      'white': Color(0xFFffffff)
    },
  );
}

class MainColorType {
  MainColorType({
    required this.red,
    required this.black,
    required this.white,
  });

  final Color red;
  final Color black;
  final Color white;

  factory MainColorType.fromMap(Map<String, dynamic> json) => MainColorType(
        red: json["red"],
        black: json["black"],
        white: json["white"],
      );

  Map<String, dynamic> toMap() => {
        "red": red,
        "black": black,
        "white": white,
      };
}
