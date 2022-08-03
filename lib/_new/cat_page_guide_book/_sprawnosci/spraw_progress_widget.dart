import 'dart:math';

import 'package:flutter/material.dart';
import 'package:harcapp/_common_widgets/empty_message_widget.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/_main.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/models/spraw.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_folder_page/spraw_folder.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/spraw_icon_rotating.dart';
import 'package:harcapp/_new/cat_page_guide_book/_sprawnosci/widgets/open_spraw_dialog.dart';
import 'package:harcapp_core/comm_classes/color_pack.dart';
import 'package:harcapp_core/comm_widgets/app_card.dart';
import 'package:harcapp_core/comm_widgets/gradient_widget.dart';
import 'package:harcapp_core/comm_widgets/simple_button.dart';
import 'package:harcapp_core/dimen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class SprawProgressWidget extends StatefulWidget{

  static const int maxDispCount = 18;

  final bool backgroundIcon;

  final bool showIcons;
  final void Function(BuildContext)? onOpen;

  const SprawProgressWidget({this.backgroundIcon=false, this.showIcons=true, this.onOpen, super.key});

  @override
  State<StatefulWidget> createState() => SprawProgressWidgetState();

}

class SprawProgressWidgetState extends State<SprawProgressWidget>{

  static const double completedOpacity = 1;
  static const double inProgressOpacity = .45;
  static const double savedOpacity = .1;

  static const double _paddingVal = Dimen.SIDE_MARG;

  late List<Spraw> allSpraws;
  late List<Spraw> hiddSpraws;
  late List<Spraw> displSpraws;

  @override
  void initState() {

    allSpraws = [];
    hiddSpraws = [];
    displSpraws = [];

    for(String uniqName in Spraw.completedList) {
      Spraw? spraw = Spraw.fromUID(uniqName);
      if(spraw == null) continue;
      allSpraws.add(spraw);
    }

    for(String uniqName in Spraw.inProgressList) {
      Spraw? spraw = Spraw.fromUID(uniqName);
      if(spraw == null) continue;
      if(!allSpraws.contains(spraw)) allSpraws.add(spraw);
    }

    for(String uniqName in SprawFolder.omega.sprawUIDs) {
      Spraw? spraw = Spraw.fromUID(uniqName);
      if(spraw == null) continue;
      if(!allSpraws.contains(spraw)) allSpraws.add(spraw);
    }

    allSpraws.shuffle();

    if(allSpraws.length>SprawProgressWidget.maxDispCount) {
      hiddSpraws = allSpraws;
    }else{
      displSpraws = allSpraws;
    }

    super.initState();
  }

  Spraw onNewUIDRequested(Spraw? oldSpraw){
    int index = Random().nextInt(hiddSpraws.length);
    Spraw? spraw = hiddSpraws[index];
    hiddSpraws.remove(spraw);
    if(oldSpraw != null)
      hiddSpraws.add(oldSpraw);
    displSpraws.add(spraw);
    return spraw;
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    if(hiddSpraws.isEmpty) {
      for (Spraw? spraw in allSpraws) {
        children.add(Opacity(
            opacity:
            spraw!.completed ?
            completedOpacity :
            (spraw.inProgress ?
            inProgressOpacity :
            savedOpacity),

            child: SprawIcon(
                spraw,
                onTap: () => openSprawDialog(context, spraw)
            )
        ));
      }

      for (int i=0; i< SprawProgressWidget.maxDispCount - allSpraws.length; i++) {
        children.add(
            Opacity(
                opacity: savedOpacity,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SprawnosciPage())),
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) => Container(
                      width: constraints.maxWidth,
                      height: constraints.maxWidth,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(constraints.maxWidth),
                        border: Border.all(
                            color: iconEnab_(context),
                            width: SprawIcon.borderFraction*constraints.maxWidth,
                            style: BorderStyle.solid
                        ),
                      ),
                      child: GradientWidget(
                        colorStart: textEnab_(context)!,
                        colorEnd: backgroundIcon_(context),
                      ),
                    ),
                  )
                )
            )
        );
      }

    } else
      for(int i=0; i<SprawProgressWidget.maxDispCount; i++)
        children.add(SprawIconRotating(
          onNewUIDRequested: onNewUIDRequested,
          onTap: (spraw) => openSprawDialog(context, spraw),
        ));

    return AspectRatio(
      aspectRatio: (SprawIcon.sizeBig*6 + 5*Dimen.ICON_MARG + 2*_paddingVal)/(SprawIcon.sizeBig*3 + 2*Dimen.ICON_MARG + 2*_paddingVal),
      child:
      children.isEmpty?
      SimpleButton(
        radius: AppCard.BIG_RADIUS,
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SprawnosciPage())),
        child: const EmptyMessageWidget(
            text: 'Zdobywaj!',
            icon: MdiIcons.gamepadCircleUp
          ), 
      ):
      GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(_paddingVal),
        crossAxisSpacing: Dimen.ICON_MARG,
        mainAxisSpacing: Dimen.ICON_MARG,
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: children,
        //clipBehavior: Clip.none,
      ),
    );
  }

}