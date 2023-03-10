import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../_common_widgets/harc_app.dart';

class PatroniteSupportWidget extends StatefulWidget{

  static const String tagGuideBook = 'tagGuideBook';
  static const String tagTableOfCont = 'tagTableOfCont';
  static const String tagSprawnosci = 'tagSprawnosci';

  final String stateTag;
  final String title;
  final String description;
  final Color colorStart;
  final Color colorEnd;
  final bool expandable;
  final EdgeInsets? margin;

  const PatroniteSupportWidget({
    required this.stateTag,
    required this.title,
    required this.description,
    required this.colorStart,
    required this.colorEnd,
    this.expandable = true,
    this.margin,
    super.key
  });

  @override
  State<StatefulWidget> createState() => PatroniteSupportWidgetState();

}

class PatroniteSupportWidgetState extends State<PatroniteSupportWidget>{

  static const Curve _curve = Curves.easeInOutQuad;
  static const Duration _duration = Duration(milliseconds: 300);

  static Map<String, bool> expandedMap = {};

  bool get expanded => !expandable || expandedMap[stateTag]!;
  set expanded(bool value) => expandedMap[stateTag] = value;

  String get stateTag => widget.stateTag;
  String get title => widget.title;
  String get description => widget.description;
  Color get colorStart => widget.colorStart;
  Color get colorEnd => widget.colorEnd;

  bool get expandable => widget.expandable;
  EdgeInsets? get margin => widget.margin;

  @override
  void initState() {
    if(!expandedMap.containsKey(stateTag)) expandedMap[stateTag] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: margin??EdgeInsets.zero,
    child: GradientWidget(
      clipBehavior: Clip.hardEdge,
      elevation: AppCard.defElevation,
      colorStart: colorStart,
      colorEnd: colorEnd,
      radius: AppCard.bigRadius,
      child: SimpleButton(
              color: background_(context),
              margin: const EdgeInsets.all(Dimen.defMarg),
              borderRadius: BorderRadius.circular(AppCard.bigRadius - 4),
              onTap: expanded?null: () => launchURL('https://patronite.pl/harcapp'),
              child: AnimatedSize(
                  duration: _duration,
                  curve: _curve,
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  child: expanded?
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                      padding: const EdgeInsets.only(
                        top: Dimen.ICON_MARG,
                        left: Dimen.ICON_MARG,
                        right: Dimen.ICON_MARG,
                        bottom: Dimen.defMarg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                              title,
                              style: AppTextStyle(
                                  fontSize: Dimen.TEXT_SIZE_APPBAR,
                                  fontWeight: weight.halfBold,
                                  color: iconEnab_(context)
                              ),
                              textAlign: TextAlign.center
                          ),

                          const SizedBox(height: Dimen.defMarg),

                          AppText(
                              description,
                              size: Dimen.TEXT_SIZE_BIG,
                              color: iconEnab_(context)
                          ),

                        ],
                      )
                  ),

                  Row(
                    children: [

                      if(expandable)
                        SimpleButton.from(
                          radius: 0,
                          context: context,
                          margin: EdgeInsets.zero,
                          text: 'Pomniejsz',
                          fontWeight: weight.halfBold,
                          onTap: () => setState(() => expanded = !expanded),
                        ),

                      Expanded(child: Container()),

                      SimpleButton.from(
                        radius: 0,
                        context: context,
                        margin: EdgeInsets.zero,
                        text: 'Wesprzyj HarcAppkę',
                        textColor: colorEnd,
                        iconColor: colorEnd,
                        icon: MdiIcons.handHeart,
                        iconLeading: false,
                        fontWeight: weight.bold,
                        onTap: () => launchURL('https://patronite.pl/harcapp')
                      ),

                    ],
                  )

                ],
              ):
              Row(
                children: [
                  const SizedBox(
                    height: Dimen.ICON_FOOTPRINT,
                    width: Dimen.ICON_FOOTPRINT,
                  ),

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                            'Wesprzyj ',
                            size: Dimen.TEXT_SIZE_APPBAR,
                            color: iconEnab_(context),
                            textAlign: TextAlign.center
                        ),

                        HarcApp(
                          size: Dimen.TEXT_SIZE_APPBAR,
                          color: iconEnab_(context),
                        ),

                        AppText(
                            'kę!',
                            size: Dimen.TEXT_SIZE_APPBAR,
                            color: iconEnab_(context),
                            textAlign: TextAlign.center
                        ),
                      ],
                    ),
                  ),

                  if(expandable)
                    IconButton(
                      icon: Icon(expanded?MdiIcons.chevronDown:MdiIcons.chevronUp),
                      onPressed: () => setState(() => expanded = !expanded),
                    ),

                ],
              )
          )),
    ),
  );

}