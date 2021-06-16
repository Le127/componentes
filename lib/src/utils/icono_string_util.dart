import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  "add_alert": Icons.add_alert,
  "accessibility": Icons.accessibility,
  "folder_open": Icons.folder_open,
  "donut_large": Icons.donut_large,
  "input": Icons.input,
  "tune": Icons.tune,
  "list": Icons.list,
};

Icon getIcon(String nombreIcono, Color color, size) {
  return Icon(
    _icons[nombreIcono],
    color: color,
    size: size,
  );
}
