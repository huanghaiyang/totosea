import 'package:flutter/material.dart';

Color hexToColor(String code) {
  if(code == null || code.isEmpty) return null;
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}