import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';

class ExtendedFloatingButton extends StatelessWidget{

  final IconData icon;
  final String text;
  final Color? textColor;

  final Color? background;
  final Color? backgroundEnd;
  final bool? floatingButtonExpanded;

  final void Function()? onTap;
  final Duration? duration;

  const ExtendedFloatingButton(
      this.icon,
      this.text,
      {this.textColor,
        this.background,
        this.backgroundEnd,
        this.floatingButtonExpanded = true,
        this.onTap,
        this.duration,
        super.key
      });

  @override
  Widget build(BuildContext context) {

    Widget child = Padding(
      padding: const EdgeInsets.only(
          left: Dimen.FLOATING_BUTTON_MARG,
          top: Dimen.FLOATING_BUTTON_MARG,
          bottom: Dimen.FLOATING_BUTTON_MARG
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon, color: textColor??iconEnab_(context)),

          AnimatedSize(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutQuart,
              alignment: Alignment.centerLeft,
              child: _TextWidget(floatingButtonExpanded, text, textColor)
          )

        ],
      ),
    );

    return Hero(
      tag: const FloatingActionButton(onPressed: null).heroTag!,
      child: SimpleButton(
          color: background??accent_(context),
          colorEnd: backgroundEnd??background??accent_(context),
          duration: duration,
          margin: EdgeInsets.zero,
          elevation: 6,
          padding: EdgeInsets.zero,
          radius: 100,
          child: child,
          onTap: onTap,
          colorSplash: Colors.white24
      ),
    );
  }

}

class _TextWidget extends StatelessWidget{

  final bool? floatingButtonExpanded;
  final String text;
  final Color? textColor;

  const _TextWidget(
      this.floatingButtonExpanded,
      this.text,
      this.textColor
      );

  @override
  Widget build(BuildContext context) {

    List<Widget> children;

    if(floatingButtonExpanded!)
      children = [
        const SizedBox(width: Dimen.ICON_MARG),
        Text(
          text,
          style: AppTextStyle(
              fontWeight: weight.halfBold,
              fontSize: Dimen.TEXT_SIZE_BIG,
              color: textColor??iconEnab_(context)
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(width: Dimen.FLOATING_BUTTON_MARG + 10.0)
      ];
    else
      children = [const SizedBox(width: Dimen.FLOATING_BUTTON_MARG)];

    return Row(children: children);
  }

}