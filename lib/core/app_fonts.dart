import 'package:flutter/material.dart';

class AppText {
  final TextStyle style;

  AppText(this.style);
  AppText size(double value) => AppText(style.copyWith(fontSize: value));
  AppText color(Color color) => AppText(style.copyWith(color: color));
  AppText get bold => AppText(style.copyWith(fontWeight: FontWeight.bold));

  static AppText get key => AppText(const TextStyle(
    fontFamily: 'dm-sans',
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  ));

  static AppText get label => AppText(const TextStyle(
    fontFamily: 'dm-sans',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ));
}