import 'package:flutter/material.dart';
import 'package:harcapp_core/comm_classes/common.dart';
import 'package:harcapp_core/comm_classes/app_text_style.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/animated_child_slider.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/app_text.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PatroniteSupportWidget extends StatefulWidget{

  static const String tagGuideBook = 'tagGuideBook';
  static const String tagTableOfCont = 'tagTableOfCont';
  static const String tagSprawnosci = 'tagSprawnosci';

  final String stateTag;
  final String title;
  final String description;
  final bool expandable;
  final EdgeInsets? margin;

  const PatroniteSupportWidget({
    required this.stateTag,
    required this.title,
    required this.description,
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
  bool get expandable => widget.expandable;
  EdgeInsets? get margin => widget.margin;

  @override
  void initState() {
    if(!expandedMap.containsKey(stateTag)) expandedMap[stateTag] = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCard(
        elevation: AppCard.bigElevation,
        radius: AppCard.bigRadius,
        margin: margin??EdgeInsets.zero,
        padding: EdgeInsets.zero,
        child: Stack(
          children: [

            Positioned(
                top: -32,
                bottom: -32,
                left: -60,
                child: Row(
                  children: [
                    AnimatedSize(
                      duration: _duration,
                      curve: _curve,
                      child: SizedBox(width: expanded?0:35),
                    ),
                    Opacity(
                      opacity: 0.4,
                      child: Image.asset('assets/images/patronite_logo_full.png'),
                    ),
                  ],
                )
            ),

            Padding(
              padding: const EdgeInsets.all(Dimen.SIDE_MARG),
              child: Column(
                children: [

                  Row(
                    children: [
                      const SizedBox(height: Dimen.ICON_FOOTPRINT),

                      if(expandable)
                        IconButton(
                          icon: Icon(expanded?MdiIcons.chevronDown:MdiIcons.chevronUp),
                          onPressed: () => setState(() => expanded = !expanded),
                        ),

                      Expanded(
                          child: AnimatedChildSlider(
                            index: expanded?0:1,
                            duration: _duration,
                            children: [
                              Text(
                                  title,
                                  style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                                    fontWeight: weight.bold,
                                    color: iconEnab_(context)
                                  ),
                                  textAlign: TextAlign.center
                              ),

                              Text(
                                  'Wesprzyj HarcAppkę!',
                                  style: AppTextStyle(
                                    fontSize: Dimen.TEXT_SIZE_APPBAR,
                                    fontWeight: weight.bold,
                                    color: iconEnab_(context)
                                  ),
                                  textAlign: TextAlign.center
                              ),

                            ],
                          )
                      ),

                      if(expandable)
                        AnimatedOpacity(
                          opacity: expanded?0:1,
                          duration: _duration,
                          child: IconButton(
                            icon: const Icon(MdiIcons.arrowRight),
                            onPressed: expanded?null:() => launchURL('https://patronite.pl/harcapp'),
                          ),
                        ),

                    ],
                  ),

                  AnimatedSize(
                    duration: _duration,
                    curve: _curve,
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    child:
                    expanded?
                    Column(
                      children: [

                        const SizedBox(height: .5*Dimen.SIDE_MARG),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: Dimen.ICON_MARG,
                            right: Dimen.ICON_MARG,
                            bottom: Dimen.ICON_MARG,
                          ),
                          child: AppText(
                            description,
                            size: Dimen.TEXT_SIZE_BIG,
                            color: iconEnab_(context)
                          ),
                        ),

                        Align(
                          alignment: Alignment.bottomRight,
                          child: SimpleButton.from(
                              context: context,
                              icon: MdiIcons.arrowRight,
                              text: 'Wesprzyj HarcAppkę',
                              iconLeading: false,
                              onTap: () => launchURL('https://patronite.pl/harcapp')
                          ),
                        ),
                      ],
                    ):
                    Container(),
                  ),


                ],
              ),
            )

          ],
        )
    );
  }

}