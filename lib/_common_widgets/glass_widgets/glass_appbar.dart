import 'package:flutter/material.dart';
import './glass_container.dart';

class GlassAppBar extends StatelessWidget implements PreferredSizeWidget {
  GlassAppBar({
    this.leading,
    this.title,
    this.centerTitle,
  }) : preferredSize = Size.fromHeight(kToolbarHeight);

  final Widget? leading;
  final Widget? title;
  final bool? centerTitle;

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: GlassContainer(radius: 0),
      leading: leading,
      title: title,
      centerTitle: centerTitle,
      iconTheme: const IconThemeData(
        color: Colors.white,
        opacity: 0.4,
      ),
    );
  }
}