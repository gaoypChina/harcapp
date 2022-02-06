import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SearchField extends StatelessWidget{

  static const double DEF_MARG_VAL = Dimen.DEF_MARG;

  static const EdgeInsets normMargin = EdgeInsets.only(
    top: DEF_MARG_VAL,
    left: DEF_MARG_VAL,
    right: DEF_MARG_VAL
  );

  static Widget defLeadWidget(BuildContext context) =>
    Padding(
      child: Icon(MdiIcons.magnify, color: hintEnab_(context)),
      padding: EdgeInsets.all(Dimen.ICON_MARG),
    );

    final String hint;
    final double elevation;
    final Function(String text) onChanged;
    final TextEditingController controller;
    final EdgeInsets margin;
    final Widget leading;
    final Widget trailing;
    final Widget bottom;
    final Color background;
    final FocusNode focusNode;
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
      this.background=Colors.transparent,
      this.focusNode,
      this.enabled = true,
    });

    @override
    Widget build(BuildContext context) {

      return Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 42,
            color: background,
          ),
          AppCard(
              elevation: elevation??AppCard.bigElevation,
              margin: margin,
              padding: EdgeInsets.zero,
              borderRadius: BorderRadius.all(Radius.circular(Dimen.ICON_SIZE)),
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
                      SizedBox(width: Dimen.DEF_MARG),
                      if(trailing!=null) trailing
                    ],
                  ),

                  if(bottom!=null) bottom
                ],
              )
          )

        ],
      );
    }
  }