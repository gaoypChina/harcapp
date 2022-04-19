
import 'package:flutter/material.dart';

const String fontFamily = 'Hand15';

const Color RED_COLOR = Colors.pink;
const Color GREEN_COLOR = Colors.teal;
Color NEUTRAL_COLOR = Colors.amber[100];
const Color BLACK_COLOR = Colors.black;

enum Team{GREEN, RED, NONE, KILLER}

enum GameMode{
  LEADER, PLAYER, NONE
}

enum CardState{
  CHECKED, UNCHECKED
}

const double PREV_INACTIVE_SIDE_OPACITY = 0.3;