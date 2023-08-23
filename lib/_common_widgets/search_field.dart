import 'dart:async';

import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SearchField extends StatefulWidget{

  static const double defMargVal = Dimen.defMarg;

  static const EdgeInsets normMargin = EdgeInsets.only(
    top: defMargVal,
    left: defMargVal,
    right: defMargVal
  );

    final String? hint;
    final double? elevation;
    final FutureOr<void> Function(String text)? onChanged;
    final bool clearableText;
    final bool Function()? canClearText;
    final FutureOr<void> Function()? onTextCleared;
    final TextEditingController? controller;
    final EdgeInsets margin;
    final Widget? leading;
    final Widget? trailing;
    final Color? color;
    final Widget? bottom;
    final Color preBackground;
    final Color background;
    final bool autofocus;
    final FocusNode? focusNode;
    final bool enabled;

    static double height = Dimen.ICON_FOOTPRINT + normMargin.top;

    const SearchField({
      this.hint,
      this.elevation,
      this.onChanged,
      this.clearableText = true,
      this.canClearText,
      this.onTextCleared,
      this.controller,
      this.margin=normMargin,
      this.leading,
      this.trailing,
      this.bottom,
      this.color,
      this.preBackground = Colors.transparent,
      this.background=Colors.transparent,
      this.autofocus = false,
      this.focusNode,
      this.enabled = true,
      super.key
    });

  @override
  State<StatefulWidget> createState() => SearchFieldState();

}

class SearchFieldState extends State<SearchField>{

  String? get hint => widget.hint;
  double? get elevation => widget.elevation;
  FutureOr<void> Function(String text)? get onChanged => widget.onChanged;
  bool get clearableText => widget.clearableText;
  bool Function()? get canClearText => widget.canClearText;
  FutureOr<void> Function()? get onTextCleared => widget.onTextCleared;
  TextEditingController get controller => _controller??widget.controller!;
  EdgeInsets get margin => widget.margin;
  Widget? get leading => widget.leading;
  Widget? get trailing => widget.trailing;
  Color? get color => widget.color;
  Widget? get bottom => widget.bottom;
  Color get preBackground => widget.preBackground;
  Color get background => widget.background;
  bool get autofocus => widget.autofocus;
  FocusNode? get focusNode => widget.focusNode;
  bool get enabled => widget.enabled;

  TextEditingController? _controller;

  static Widget defLeadWidget(BuildContext context) =>
      Padding(
        padding: const EdgeInsets.all(Dimen.ICON_MARG),
        child: Icon(MdiIcons.magnify, color: hintEnab_(context)),
      );

  static Widget defLeadClearableWidget({
    required BuildContext context,
    required TextEditingController controller,
    Widget? child,
    bool Function()? canClearText,
    FutureOr<void> Function()? onCleared
  }) => AnimatedChildSlider(
    index: (canClearText?.call()??controller.text.isNotEmpty)?1:0,
    children: [
      child??defLeadWidget(context),
      IconButton(
        icon: Icon(MdiIcons.close, color: iconEnab_(context)),
        onPressed: () async {
          controller.clear();
          await onCleared?.call();
        },
      )
    ],
  );

  @override
  void initState() {
    if(widget.controller == null)
      _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
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
            clipBehavior: Clip.hardEdge,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    leading??(
                        clearableText?
                        defLeadClearableWidget(
                            context: context,
                            controller: controller,
                            canClearText: canClearText,
                            onCleared: onTextCleared
                        ):
                        defLeadWidget(context)
                    ),
                    Expanded(
                        child: IgnorePointer(
                          ignoring: !enabled,
                          child: TextField(
                            // This key has to be here in order to make other PageStorageKey's work
                            // which have the SearchField as a child.
                            key: const PageStorageKey('SearchFieldPageStorageKey'),
                            autofocus: autofocus,
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