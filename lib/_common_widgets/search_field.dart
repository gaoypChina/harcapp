import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SearchField extends StatelessWidget{

  static const double defMargVal = Dimen.defMarg;

  static const EdgeInsets normMargin = EdgeInsets.only(
    top: defMargVal,
    left: defMargVal,
    right: defMargVal
  );

  static Widget defLeadWidget(BuildContext context) =>
    Padding(
      padding: const EdgeInsets.all(Dimen.ICON_MARG),
      child: Icon(MdiIcons.magnify, color: hintEnab_(context)),
    );

    final String? hint;
    final double? elevation;
    final Function(String text)? onChanged;
    final TextEditingController? controller;
    final EdgeInsets margin;
    final Widget? leading;
    final Widget? trailing;
    final Color? color;
    final Widget? bottom;
    final Color preBackground;
    final Color background;
    final FocusNode? focusNode;
    final bool enabled;

    static double height = Dimen.ICON_FOOTPRINT + normMargin.top;

    const SearchField({
      this.hint,
      this.elevation,
      this.onChanged,
      this.controller,
      this.margin=normMargin,
      this.leading,
      this.trailing,
      this.bottom,
      this.color,
      this.preBackground = Colors.transparent,
      this.background=Colors.transparent,
      this.focusNode,
      this.enabled = true,
      super.key
    });

    @override
    Widget build(BuildContext context) {

      return Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 42,
            color: preBackground,
          ),
          Container(
            width: double.infinity,
            height: 42,
            color: background,
          ),
          Padding(
            padding: margin,
            child: Material(
                color: color??cardEnab_(context),
                elevation: elevation??AppCard.bigElevation,
                borderRadius: BorderRadius.circular(Dimen.ICON_SIZE),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        leading??defLeadWidget(context),
                        Expanded(
                            child: IgnorePointer(
                              ignoring: !enabled,
                              child: TextField(
                                focusNode: focusNode,
                                style: AppTextStyle(color: textEnab_(context)),
                                controller: controller,
                                onChanged: onChanged,
                                decoration: InputDecoration(
                                    hintText: hint,
                                    border: InputBorder.none,
                                    hintStyle: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_BIG)
                                ),
                              ),
                            )
                        ),
                        const SizedBox(width: Dimen.defMarg),
                        if(trailing!=null) trailing!
                      ],
                    ),

                    if(bottom!=null) bottom!
                  ],
                )
            ),
          )

        ],
      );
    }
  }