import 'package:flutter/material.dart';

import './glass_container.dart';

class GlassListTile extends StatelessWidget {
  const GlassListTile({
    Key? key,
    this.borderRadius = 16,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
  }) : super(key: key);

  final double borderRadius;
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      radius: borderRadius,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ListTile(
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}