
import 'package:flutter/material.dart';

abstract class ListItem {}

class WychowanieItem implements ListItem {
  final title;
  final description;
  final titleColor;

  const WychowanieItem(this.title, this.description, this.titleColor);
}

class TitledItem implements ListItem {
  final title;
  final description;

  const TitledItem(this.title, this.description);
}

class HeadingItem implements ListItem {
  final String heading;

  const HeadingItem(this.heading);
}

class OrderedItem implements ListItem {
  final String description;
  final int index;
  final imagePath;
  final Widget onClickWidget;

  const OrderedItem(this.description, this.imagePath, this.index, [this.onClickWidget]);
}