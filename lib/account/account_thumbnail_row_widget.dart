import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';

import 'account_thumbnail_widget.dart';


class AccountThumbnailRowWidget extends StatelessWidget{

  static const double defSize = AccountThumbnailWidget.defSize;
  static const double defCircleDistBig = .2*defSize;

  final List<String> accounts;
  final EdgeInsets padding;
  final double? size;
  final Color? color;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool? elevated;
  final Clip? clipBehavior;
  final double? screenWidth;
  final Widget? leading;
  final dynamic Function(int)? heroBuilder;
  final void Function()? onTap;

  const AccountThumbnailRowWidget(
      this.accounts,
      { this.padding=EdgeInsets.zero,
        this.size,
        this.color,
        this.borderColor,
        this.backgroundColor,
        this.elevated,
        this.clipBehavior,
        this.screenWidth,
        this.leading,
        this.heroBuilder,
        this.onTap,
        super.key
      });

  double get circleHeight => size??defSize;
  double get circleDistBig => .2*circleHeight;
  double get circleDistSmall => -.2*circleHeight;
  double get circleMargin => .05*circleHeight;

  double scrollViewWidth({required bool big}) => max(0, (accounts.length-1)*(circleHeight + (big?circleDistBig:circleDistSmall)) + circleHeight);

  @override
  Widget build(BuildContext context) => SizedBox(
    height: circleHeight + padding.top + padding.bottom + 2*circleMargin,
    child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => SingleChildScrollView(
          padding: padding,
          clipBehavior: clipBehavior??Clip.none,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Builder(
            builder: (BuildContext context){

              double width = constraints.maxWidth;

              bool big = scrollViewWidth(big: true) + padding.left + padding.right < width;

              List<Widget> children = [];

              for(int i=0; i<accounts.length; i++){
                String acc = accounts[i];

                Widget thumbnailWidget = Material(
                  borderRadius: BorderRadius.circular(circleHeight),
                  color: backgroundColor??background_(context),
                  child: Padding(
                    padding: EdgeInsets.all(circleMargin),
                    child: AccountThumbnailWidget(
                      name: acc,
                      elevated: elevated??false,
                      size: circleHeight,
                      color: color,
                      borderColor: borderColor,
                      onTap: onTap,
                    ),
                  )
                );

                children.add(
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: max(0, i*(circleHeight + (big?circleDistBig:circleDistSmall))),
                    //right: (i+1)*50.0,
                    child: heroBuilder == null?
                    thumbnailWidget:
                    Hero(
                      tag: heroBuilder?.call(i),
                      child: thumbnailWidget,
                    )
                  )
                );
              }

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if(leading != null)
                    leading!,

                  SizedBox(
                      width: scrollViewWidth(big: big),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: children,
                      )
                  )

                ],
              );

            }
          ),
        )),
  );

}