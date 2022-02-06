import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_classes/no_glow_behavior.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/common.dart';


Future<void> showScrollBottomSheet({@required BuildContext context, @required WidgetBuilder builder, bool scrollable: true, GlobalKey<BottomSheetTemplateState> globalKey}) async {

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
  final bool scrollable;

  const BottomSheetTemplate({
    @required this.builder,
    this.scrollable,
  });

  @override
  State<StatefulWidget> createState() => BottomSheetTemplateState();
}

class BottomSheetTemplateState extends State<BottomSheetTemplate>{

  GlobalKey contentKey;

  void notify() => setState((){});

  bool exceedsHeight;

  @override
  void initState() {
    contentKey = GlobalKey();
    exceedsHeight = true;
    super.initState();
  }

  handleSizeConf(){
    bool _exceedsHeight = contentKey.currentContext.size.height > MediaQuery.of(context).size.height;
    if(_exceedsHeight != exceedsHeight)
      setState(() => exceedsHeight = _exceedsHeight);
  }

  @override
  Widget build(BuildContext context) {

    return KeyboardVisibilityBuilder(
        builder: (context, isKeyboardVisible) {

          post(() => handleSizeConf());

          if(exceedsHeight)
            return DraggableScrollableSheet(
                expand: false,
                builder: (context, scrollController) =>
                    ScrollConfiguration(
                      behavior: NoGlowBehavior(),
                      child: SingleChildScrollView(
                          physics: AlwaysScrollableScrollPhysics(),
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
    );

  }

}

class BottomSheetDef extends StatefulWidget{

  final String title;
  final String subTitle;
  final Widget Function(BuildContext context) builder;
  final Color textColor;
  final Color color;
  final EdgeInsets childMargin;

  const BottomSheetDef({
    this.title,
    this.subTitle,
    @required this.builder,
    this.textColor,
    this.color,
    this.childMargin: const EdgeInsets.all(Dimen.BOTTOM_SHEET_MARG)
  });

  @override
  State<StatefulWidget> createState() => BottomSheetDefState();

}

class BottomSheetDefState extends State<BottomSheetDef>{

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            color: widget.color??background_(context),
            borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(12.0),
                topRight: const Radius.circular(12.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if(widget.title!=null)
              Padding(
                  padding: EdgeInsets.all(Dimen.BOTTOM_SHEET_TITLE_MARG),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(widget.title, style: AppTextStyle(fontWeight: weight.halfBold, color: widget.textColor, fontSize: Dimen.TEXT_SIZE_BIG), textAlign: TextAlign.end,),
                      if(widget.subTitle!=null) Text(widget.subTitle, style: AppTextStyle(color: hintEnab_(context), fontSize: Dimen.TEXT_SIZE_NORMAL), textAlign: TextAlign.end,),
                    ],
                  )
              ),
            Padding(
              padding: widget.childMargin,
              child: widget.builder(context),
            )
          ],
        )
    );

  }

}