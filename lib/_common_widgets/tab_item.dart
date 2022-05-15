import 'package:flutter/material.dart';

class TabItem {
  final String? text;
  final Icon? icon;
  final Widget child;

  const TabItem({this.text, this.icon, required this.child});
}
