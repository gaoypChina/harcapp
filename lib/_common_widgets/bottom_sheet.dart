import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


Future<void> showScrollBottomSheet({required BuildContext context, required WidgetBuilder builder, bool scrollable = true}) async {

  await showModalBottomSheet(
    context: context,
    isScrollControlled: scrollable,
    enableDrag: scrollable,
    backgroundColor: Colors.transparent,
    builder: (context) => BottomSheetTemplate(
        builder: builder,
        scrollable: scrollable
    ),
  );
}

class BottomSheetTemplate extends StatefulWidget{

  final WidgetBuilder builder;
  final bool? scrollable;

  const BottomSheetTemplate({
    required this.builder,
    this.scrollable,
    super.key});

  @override
  State<StatefulWidget> createState() => BottomSheetTemplateState();
}

class BottomSheetTemplateState extends State<BottomSheetTemplate>{

  GlobalKey? contentKey;

  void notify() => setState((){});

  late bool exceedsHeight;
  late StreamSubscription<bool> keyboardSubscription;

  @override
  void initState() {

    post(() => handleSizeConf());

    keyboardSubscription = KeyboardVisibilityController().onChange.listen((bool visible) =>
      handleSizeConf()
    );

    contentKey = GlobalKey();
    exceedsHeight = true;
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    keyboardSubscription.cancel();
  }

  bool handleSizeConf(){
    bool exceedsHeight = contentKey!.currentContext!.size!.height > MediaQuery.of(context).size.height;
    if(this.exceedsHeight != exceedsHeight)
      setState(() => this.exceedsHeight = exceedsHeight);

    return exceedsHeight;
  }

  @override
  Widget build(BuildContext context) {
    if(exceedsHeight)
      return DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) =>
              ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: scrollController,
                    child: Container(
                      key: contentKey,
                      child: widget.builder(context),
                    )
                ),
              )

      );
    else
      return Container(
        key: contentKey,
        child: widget.builder(context),
      );
  }

}

class BottomSheetDef extends StatefulWidget{

  static const double radius = 12.0;

  final String? title;
  final String? subTitle;
  final Widget? Function(BuildContext context) builder;
  final Color? textColor;
  final Color? color;
  final Color? colorEnd;
  final EdgeInsets childMargin;

  const BottomSheetDef({
    this.title,
    this.subTitle,
    required this.builder,
    this.textColor,
    this.color,
    this.colorEnd,
    this.childMargin = const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG),
    super.key});

  @override
  State<StatefulWidget> createState() => BottomSheetDefState();

}

class BottomSheetDefState extends State<BottomSheetDef>{

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
    child: GradientWidget(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0)
        ),
        colorStart: widget.color??background_(context),
        colorEnd: widget.colorEnd??widget.color??background_(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if(widget.title!=null)
              Padding(
                  padding: const EdgeInsets.all(Dimen.BOTTOM_SHEET_TITLE_MARG - Dimen.ICON_MARG),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(widget.title!, style: AppTextStyle(fontWeight: weight.halfBold, color: widget.textColor, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end,),
                          if(widget.subTitle!=null) Text(widget.subTitle!, style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL), textAlign: TextAlign.end,),
                        ],
                      ),

                      IconButton(
                        icon: Icon(MdiIcons.close, color: widget.textColor),
                        onPressed: () => Navigator.pop(context),
                      )

                    ],
                  )
              ),
            Padding(
              padding: widget.childMargin,
              child: widget.builder(context),
            ),
          ],
        ),

    ),
  );

  void notify() => setState((){});

}